#!/bin/bash

# 🚀 Build Menu for Tellioo

# Exit on errors
set -e

# 🧪 Validate environment
if [ ! -f .env_build ]; then
  echo "❌ Missing .env_build file. Please create one with your API keys."
  exit 1
fi

# Load environment variables
export $(cat .env_build | grep -v '#' | xargs)

# Check for missing required keys
REQUIRED_KEYS=(OPENAI_API_KEY XAI_API_KEY GEMINI_API_KEY OLLAMA_API_KEY CLAUDE_API_KEY MISTRAL_API_KEY DEEPSEEK_API_KEY)
for KEY in "${REQUIRED_KEYS[@]}"; do
  if [ -z "${!KEY}" ]; then
    echo "⚠️ Warning: $KEY is empty or missing in .env_build"
  fi
done

# Check for committed .env_build (security)
if git ls-files --cached | grep -q ".env_build"; then
  echo "⚠️ .env_build is staged in git. Please unstage it: git reset .env_build"
fi

# Menu
echo ""
echo "=============================="
echo "     🚀 Tellioo Build Menu     "
echo "=============================="
echo "1) Build APK (Release)"
echo "2) Build AAB (Release for Play Store)"
echo "3) Run Android app in Debug mode"
echo "4) Run Android app in Release mode"
echo "5) Build iOS (Release)"
echo "6) Run iOS app in Release mode"
echo "7) Exit"
echo ""

read -p "Select an option [1-7]: " option

get_dart_defines() {
  echo "--dart-define=OPENAI_API_KEY=$OPENAI_API_KEY \
  --dart-define=XAI_API_KEY=$XAI_API_KEY \
  --dart-define=GEMINI_API_KEY=$GEMINI_API_KEY \
  --dart-define=OLLAMA_API_KEY=$OLLAMA_API_KEY \
  --dart-define=CLAUDE_API_KEY=$CLAUDE_API_KEY \
  --dart-define=MISTRAL_API_KEY=$MISTRAL_API_KEY \
  --dart-define=DEEPSEEK_API_KEY=$DEEPSEEK_API_KEY"
}

case $option in
  1)
    echo "🔨 Building APK (Release)..."
    flutter pub get
    flutter clean
    flutter build apk --release $(get_dart_defines)
    echo "✅ APK ready at build/app/outputs/flutter-apk/app-release.apk"
    read -p "👉 Install APK to connected device? (y/n): " install
    if [ "$install" == "y" ]; then
      adb install -r build/app/outputs/flutter-apk/app-release.apk
      echo "🚀 APK installed to device!"
    fi
    ;;
  2)
    echo "🔨 Building AAB (Release for Play Store)..."
    flutter pub get
    flutter clean
    flutter build appbundle --release $(get_dart_defines)
    echo "✅ AAB ready at build/app/outputs/bundle/release/app-release.aab"
    ;;
  3)
    echo "🐛 Running Android app in Debug mode..."
    flutter pub get
    flutter run
    ;;
  4)
    echo "🚀 Running Android app in Release mode..."
    flutter pub get
    ANDROID_DEVICES=$(flutter devices | grep -i "android")

    if [ -z "$ANDROID_DEVICES" ]; then
      echo "❌ No Android devices found."
      exit 1
    fi

    DEVICE_COUNT=$(echo "$ANDROID_DEVICES" | wc -l)

    if [ "$DEVICE_COUNT" -gt 1 ]; then
      echo "📱 Available Android devices:"
      echo "$ANDROID_DEVICES" | nl -w2 -s'. '
      read -p "👉 Select a device by number: " DEVICE_INDEX
      DEVICE_ID=$(echo "$ANDROID_DEVICES" | sed -n "${DEVICE_INDEX}p" | awk -F '•' '{print $2}' | xargs)
    else
      DEVICE_ID=$(echo "$ANDROID_DEVICES" | awk -F '•' '{print $2}' | xargs)
    fi

    echo "✅ Selected Android device ID: $DEVICE_ID"
    flutter run --release -d "$DEVICE_ID" $(get_dart_defines)
    ;;
  5)
    echo "📱 Building iOS (Release)..."
    if ! command -v xcodebuild &> /dev/null; then
      echo "❌ Xcode command line tools not found. Please install Xcode and run xcode-select --install"
      exit 1
    fi
    flutter pub get
    flutter clean
    flutter build ios --release $(get_dart_defines)
    echo "✅ iOS build complete! Open Xcode to archive and deploy."
    ;;
  6)
    echo "🚀 Running iOS app in Release mode..."
    flutter pub get

    PHYSICAL_IOS_DEVICES=$(flutter devices | grep -i "ios" | grep -vi "simulator")

    if [ -z "$PHYSICAL_IOS_DEVICES" ]; then
      echo "⚠️ No physical iOS device found. Fallback to simulator in debug mode?"
      read -p "👉 Continue with simulator? (y/n): " fallback
      if [ "$fallback" == "y" ]; then
        flutter run
        exit 0
      else
        echo "❌ Aborting."
        exit 1
      fi
    fi

    DEVICE_COUNT=$(echo "$PHYSICAL_IOS_DEVICES" | wc -l)

    if [ "$DEVICE_COUNT" -gt 1 ]; then
      echo "📱 Available physical iOS devices:"
      echo "$PHYSICAL_IOS_DEVICES" | nl -w2 -s'. '
      read -p "👉 Select a device by number: " DEVICE_INDEX
      DEVICE_ID=$(echo "$PHYSICAL_IOS_DEVICES" | sed -n "${DEVICE_INDEX}p" | awk -F '•' '{print $2}' | xargs)
    else
      DEVICE_ID=$(echo "$PHYSICAL_IOS_DEVICES" | awk -F '•' '{print $2}' | xargs)
    fi

    echo "✅ Selected device ID: $DEVICE_ID"
    flutter run --release -d "$DEVICE_ID" $(get_dart_defines)
    ;;
  7)
    echo "👋 Exiting!"
    exit 0
    ;;
  *)
    echo "❌ Invalid option. Please choose 1-7."
    ;;
esac