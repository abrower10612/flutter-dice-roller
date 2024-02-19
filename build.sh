#!/bin/bash

# Download Flutter SDK for Linux
FLUTTER_CHANNEL="stable"
FLUTTER_VERSION="3.16.9"
FLUTTER_SDK="flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz"
wget https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/${FLUTTER_SDK}

# Extract the Flutter SDK
tar xf ${FLUTTER_SDK}

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Check Flutter version
flutter --version

# Run Flutter web build
flutter build web
