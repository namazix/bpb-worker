#!/bin/bash

set -euo pipefail

OS=$(uname -s)
if [ "$OS" != "Darwin" ]; then
    echo "This script only supports macOS."
    exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required but was not found."
    exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
    echo "unzip is required but was not found."
    exit 1
fi

detect_arch() {
    case "$(uname -m)" in
        arm64|aarch64)
            echo "arm64"
            ;;
        x86_64|amd64)
            if [ "$(sysctl -in hw.optional.arm64 2>/dev/null || echo 0)" = "1" ]; then
                echo "arm64"
            else
                echo "amd64"
            fi
            ;;
        *)
            return 1
            ;;
    esac
}

ARCH=$(detect_arch) || {
    echo "Unsupported macOS architecture: $(uname -m)"
    exit 1
}

BINARY="BPB-Wizard"
ARCHIVE="${BINARY}-darwin-${ARCH}.zip"
INSTALL_DIR="${BPB_WIZARD_DIR:-$HOME/.local/share/bpb-wizard}"
BIN_PATH="${INSTALL_DIR}/${BINARY}"
VERSION_URL="https://raw.githubusercontent.com/bia-pain-bache/BPB-Wizard/main/VERSION"
DOWNLOAD_URL="https://github.com/bia-pain-bache/BPB-Wizard/releases/latest/download/${ARCHIVE}"
TMP_DIR=$(mktemp -d "${TMPDIR:-/tmp}/bpb-wizard.XXXXXX")

cleanup() {
    rm -rf "$TMP_DIR"
}

trap cleanup EXIT

mkdir -p "$INSTALL_DIR"
LATEST_VERSION=$(curl -fsSL "$VERSION_URL")

if [ -x "$BIN_PATH" ]; then
    INSTALLED_VERSION=$("$BIN_PATH" --version 2>/dev/null || true)

    if [ "$INSTALLED_VERSION" = "$LATEST_VERSION" ]; then
        echo "BPB Wizard ${INSTALLED_VERSION} is already installed. Launching..."
        exec "$BIN_PATH"
    fi

    if [ -n "$INSTALLED_VERSION" ]; then
        echo "Updating BPB Wizard from ${INSTALLED_VERSION} to ${LATEST_VERSION}..."
    else
        echo "Reinstalling BPB Wizard ${LATEST_VERSION}..."
    fi
else
    echo "Installing BPB Wizard ${LATEST_VERSION}..."
fi

echo "Downloading ${ARCHIVE}..."
curl -L -# -o "${TMP_DIR}/${ARCHIVE}" "$DOWNLOAD_URL"

echo "Extracting archive..."
unzip -oq "${TMP_DIR}/${ARCHIVE}" -d "$TMP_DIR"

if [ ! -f "${TMP_DIR}/${BINARY}" ]; then
    echo "Downloaded archive does not contain ${BINARY}."
    exit 1
fi

install -m 755 "${TMP_DIR}/${BINARY}" "$BIN_PATH"
xattr -dr com.apple.quarantine "$INSTALL_DIR" >/dev/null 2>&1 || true

echo "Installed BPB Wizard ${LATEST_VERSION} to ${BIN_PATH}"
exec "$BIN_PATH"
