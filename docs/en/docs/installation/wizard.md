# :material-new-box:{ .md .middle } Workers and Pages installation - Wizard

To simplify the setup process and prevent user mistakes during creation, the [BPB Wizard](https://github.com/bia-pain-bache/BPB-Wizard) project was launched. It supports both Workers and Pages methods and is highly recommended to use.

![Pages Application](../images/wizard.jpg)

## 1. Cloudflare account

To use this method, all you need is a Cloudflare account. You can [sign up here](https://dash.cloudflare.com/sign-up/), and don’t forget to check your email afterward to verify your account.

## 2. Install BPB Panel

!!! warning
    If you're connected to a VPN, disconnect it.

### Windows

Based on your system architecture, [download the ZIP file](https://github.com/bia-pain-bache/BPB-Wizard/releases/latest), unzip it, and run the program.

!!! warning
    The Wizard downloads `worker.js` from GitHub to customize and deploy it to your Cloudflare account. Because the binary is not code-signed, Windows Defender or other antivirus software may warn about it. Temporarily allow it if you trust the official release.

### macOS

The quickest way on macOS is to run this command in Terminal:

```bash title="macOS - Apple Silicon and Intel"
bash <(curl -fsSL https://raw.githubusercontent.com/bia-pain-bache/BPB-Worker-Panel/main/scripts/install-macos-wizard.sh)
```

It automatically detects whether your Mac is Apple Silicon or Intel, installs or updates BPB Wizard inside `~/.local/share/bpb-wizard`, and launches it.

If you prefer manual installation, download the matching ZIP from the [latest release](https://github.com/bia-pain-bache/BPB-Wizard/releases/latest), unzip it, then run `./BPB-Wizard` from Terminal.

- Apple Silicon: `BPB-Wizard-darwin-arm64.zip`
- Intel: `BPB-Wizard-darwin-amd64.zip`

!!! warning
    `BPB-Wizard` is not signed by Apple, so Gatekeeper may show a warning after a manual download.

If Gatekeeper blocks it, open Terminal in the extracted folder and run:

```bash title="macOS - Remove Quarantine"
xattr -dr com.apple.quarantine BPB-Wizard
chmod +x BPB-Wizard
./BPB-Wizard
```

### Android (Termux) - Linux

Android users who have Termux installed on their phone and Linux users can install the BPB Panel by running this command:

```bash title="Termux - Linux"
bash <(curl -fsSL https://raw.githubusercontent.com/bia-pain-bache/BPB-Wizard/main/install.sh)
```

!!! warning  
    Be sure to download and install Termux only from its [official source](https://github.com/termux/termux-app/releases/latest). Installing via Google Play might cause issues.

The first question asks whether you want to create a new panel or modify existing panels in the account.

Then logs into your Cloudflare account, Asks for your permission, returns to the terminal and asks you a series of questions.

If you choose option 1, it will ask a series of configuration questions. You can use the default values or input your own. In the end, it opens the panel for you in your browser — that’s it.

!!! note
    For each setting it asks about, it has already generated a secure, personal value for you. You can simply press Enter to accept it and move on to the next question, or input your own values.

If you choose option 2, it lists deployed Workers and Pages projects and you can choose which one to modify.

## Updating Panel

Just run wizard and select option 2 for the first question. It will show you a list of project names in your account — you can choose any to update or delete.
