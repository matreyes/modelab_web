#!/bin/bash
set -e

# Download zola if not available
if ! command -v zola &> /dev/null; then
    ZOLA_VERSION="0.22.1"
    echo "Downloading zola $ZOLA_VERSION..."
    curl -sL "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
        | tar -xz -C .
    export PATH="$PWD:$PATH"
fi

echo "Zola version: $(zola --version)"

# Build CSS
npm install
npm run css:build

# Build site
zola build
