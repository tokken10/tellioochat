#!/bin/bash

# 🔥 Quick AAB (Play Store) build script for Tellioo

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

# Build AAB with dart-define
flutter build appbundle --release --dart-define=XAI_API_KEY=$XAI_API_KEY

echo "✅ AAB build complete! File is at build/app/outputs/bundle/release/app-release.aab"