# :material-new-box:{ .md .middle } راه‌اندازی خودکار Workers و Pages

برای ساده‌تر کردن فرآیند راه‌اندازی و جلوگیری از اشتباهات کاربرها، پروژه [BPB Wizard](https://github.com/bia-pain-bache/BPB-Wizard) راه‌اندازی شده. این ابزار از هر دو روش Workers و Pages پشتیبانی می‌کنه و استفاده ازش خیلی توصیه می‌شه.

![ویزارد BPB](../images/wizard.jpg)

## ۱. حساب Cloudflare

برای استفاده از این روش، فقط به یه حساب Cloudflare نیاز دارید. می‌تونید [از اینجا ثبت‌نام کنید](https://dash.cloudflare.com/sign-up/). بعدش یادتون نره ایمیلتون رو چک کنید تا حساب رو تأیید کنید.

## ۲. نصب پنل BPB

!!! warning
    اگه به VPN وصل هستید، قطعش کنید.

### Windows

بر اساس معماری سیستم‌عاملتون، [فایل ZIP مناسب رو دانلود کنید](https://github.com/bia-pain-bache/BPB-Wizard/releases/latest)، از حالت فشرده خارج کنید و برنامه رو اجرا کنید.

!!! warning
    ویزارد فایل `worker.js` رو از GitHub دانلود می‌کنه تا شخصی‌سازی بشه و روی حساب Cloudflare شما دیپلوی بشه. چون فایل اجرایی امضای دیجیتال نداره، ممکنه Windows Defender یا آنتی‌ویروس‌های دیگه بهش هشدار بدن. اگر فایل رو از سورس رسمی گرفتید، موقتاً اجازه اجرا بدید.

### macOS

سریع‌ترین راه روی macOS اینه که این دستور رو داخل Terminal اجرا کنید:

```bash title="macOS - Apple Silicon و Intel"
bash <(curl -fsSL https://raw.githubusercontent.com/bia-pain-bache/BPB-Worker-Panel/main/scripts/install-macos-wizard.sh)
```

این دستور خودش تشخیص می‌ده مک شما Apple Silicon هست یا Intel، ویزارد رو داخل `~/.local/share/bpb-wizard` نصب یا به‌روزرسانی می‌کنه و بعد اجراش می‌کنه.

اگه ترجیح می‌دید دستی نصب کنید، فایل ZIP مناسب رو از [آخرین Release](https://github.com/bia-pain-bache/BPB-Wizard/releases/latest) دانلود کنید، از حالت فشرده خارج کنید و بعد `./BPB-Wizard` رو داخل Terminal اجرا کنید.

- Apple Silicon: `BPB-Wizard-darwin-arm64.zip`
- Intel: `BPB-Wizard-darwin-amd64.zip`

!!! warning
    `BPB-Wizard` توسط Apple امضا نشده، برای همین ممکنه بعد از دانلود دستی، Gatekeeper بهتون هشدار نشون بده.

اگر Gatekeeper جلوی اجرا رو گرفت، داخل پوشه استخراج‌شده این دستورها رو در Terminal اجرا کنید:

```bash title="macOS - Remove Quarantine"
xattr -dr com.apple.quarantine BPB-Wizard
chmod +x BPB-Wizard
./BPB-Wizard
```

### Android (Termux) و Linux

کاربرای اندروید که Termux رو روی گوشیشون نصب کردن و همین‌طور کاربرای Linux می‌تونن با اجرای دستور زیر پنل BPB رو نصب کنن:

```bash title="Termux - Linux"
bash <(curl -fsSL https://raw.githubusercontent.com/bia-pain-bache/BPB-Wizard/main/install.sh)
```

!!! warning
    حتماً Termux رو فقط از [منبع رسمی](https://github.com/termux/termux-app/releases/latest) دانلود و نصب کنید. نصب از گوگل پلی ممکنه مشکلاتی ایجاد کنه.

اولین سؤال اینه که می‌خواید یه پنل جدید بسازید یا پنل‌های موجود توی حساب رو ویرایش کنید.

بعدش وارد حساب Cloudflare شما می‌شه و ازتون اجازه دسترسی میخواد، به ترمینال برمی‌گرده و چندتا سؤال ازتون می‌پرسه.

اگه گزینه ۱ رو انتخاب کرده باشید، یه سری سؤال درباره تنظیمات می‌پرسه. می‌تونید از مقادیر پیش‌فرض استفاده کنید یا مقادیر خودتون رو وارد کنید. در نهایت، پنل رو توی مرورگرتون باز می‌کنه — همین!

!!! note
    برای هر تنظیماتی که می‌پرسه، یه مقدار امن و شخصی‌سازی‌شده از قبل براتون ساخته. می‌تونید فقط Enter بزنید تا همون رو قبول کنه و بره سؤال بعدی، یا مقادیر خودتون رو وارد کنید.

اگه گزینه ۲ رو انتخاب کرده باشید، لیست پروژه‌های Workers و Pages ساخته شده رو نشون می‌ده و می‌تونید انتخاب کنید کدوم رو ویرایش کنید.

## به‌روزرسانی پنل

فقط Wizard رو اجرا کنید و برای سؤال اول گزینه ۲ رو انتخاب کنید. یه لیست از اسم پروژه‌های توی حسابتون نشون می‌ده — می‌تونید هر کدوم رو به آخرین نسخه آپدیت کنید یا کلا حذف کنید.
