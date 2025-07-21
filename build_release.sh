#!/bin/bash

# 🔥 Quick release build script for Tellioo

# Load .env_build file
if [ -f .env_build ]; then
  export $(cat .env_build | grep -v '#' | xargs)
else
  echo "❌ Missing .env_build file. Please create one with your XAI_API_KEY."
  exit 1
fi

# Make sure Flutter is ready
flutter pub get
flutter clean

# Build APK with dart-define
flutter build apk --release --dart-define=XAI_API_KEY=$XAI_API_KEY

echo "✅ Build complete! APK is at build/app/outputs/flutter-apk/app-release.apk"

# Auto-install
adb install -r build/app/outputs/flutter-apk/app-release.apk

echo "🚀 APK installed to device!"