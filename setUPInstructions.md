# tellioo

[![Flutter](https://img.shields.io/badge/Flutter-3.22-blue)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-brightgreen)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey)]()

> A cross-platform, AI-powered chat app built with Flutter.

---

## ⚙️ Setup Instructions

### 1. Environment Setup

You must create the following files before building the app:

- **`.env`** (for local Debug mode) based on `.env.example.txt`
- **`.env_build`** (for release builds)

```bash
# .env_build
OPENAI_API_KEY=your_openai_key
XAI_API_KEY=your_xai_key        # Required to run the app out-of-the-box!
GEMINI_API_KEY=your_gemini_key
OLLAMA_API_KEY=your_ollama_key
CLAUDE_API_KEY=your_claude_key
MISTRAL_API_KEY=your_mistral_key
DEEPSEEK_API_KEY=your_deepseek_key
```

⚠️ `XAI_API_KEY` is required if you want the chat functionality to work immediately after installation.

---

## 📦 Build & Run

Run this to get started:

```bash
chmod +x build_menu.sh
./build_menu.sh
```

You'll be presented with an interactive menu:

```
==============================
     🚀 Tellioo Build Menu     
==============================
1) Build APK (Release)
2) Build AAB (Release for Play Store)
3) Run Android app in Debug mode
4) Run Android app in Release mode
5) Build iOS (Release)
6) Run iOS app in Release mode
7) Exit
```

### Menu Options Overview

| Option | Action                                | Uses API Keys  |
|--------|---------------------------------------|----------------|
| 1      | Build APK (Release)                   | ✅ `.env_build` |
| 2      | Build AAB (Play Store)                | ✅ `.env_build` |
| 3      | Run Android Debug                     | ✅ `.env`       |
| 4      | Run Android Release                   | ✅ `.env_build` |
| 5      | Build iOS Release (Xcode Archive)     | ✅ `.env_build` |
| 6      | Run iOS in Release mode (interactive) | ✅ `.env_build` |
| 7      | Exit the build menu                   | —              |

---

## 💡 Build System Features

- Secure injection of API keys using `--dart-define`
- Auto-detection of Android and iOS devices
- Option to install APKs directly to a device
- Fallback to iOS Simulator when needed
- Warnings for missing keys or misconfigured files
- Prevents accidental git commits of sensitive data

---

## 🔐 Security Notes

- Do **not** commit `.env` or `.env_build` to source control.
- Add the following to your `.gitignore`:

```gitignore
.env
.env_build
```

Secrets are passed at build time and are never hardcoded into the app.

---

## 🛠 Manual Build Commands (Advanced)

You can also build manually if preferred:

```bash
flutter build apk --release --dart-define=XAI_API_KEY=your_key
flutter build appbundle --release --dart-define=XAI_API_KEY=your_key
flutter build ios --release --dart-define=XAI_API_KEY=your_key
flutter run --release --dart-define=XAI_API_KEY=your_key
```

With multiple providers:

```bash
flutter build apk --release   --dart-define=OPENAI_API_KEY=your_openai_key   --dart-define=XAI_API_KEY=your_xai_key   --dart-define=GEMINI_API_KEY=your_gemini_key
```

---

## ✅ Final Checklist

| Task                                     | Status |
|------------------------------------------|--------|
| `.env` created for Debug                 | ✅      |
| `.env_build` created for Release builds  | ✅      |
| API keys defined (XAI at minimum)        | ✅      |
| `build_menu.sh` and helper scripts ready | ✅      |
| Documentation & Quick Start included     | ✅      |
| Project zipped under 300MB               | ✅      |

---

Happy building!

⸻

📣 Reminder

If you ever add new AI providers (like Meta’s LLaMA or others in the future),
just update .env_build, constants.dart, and you’re good to go!

---

