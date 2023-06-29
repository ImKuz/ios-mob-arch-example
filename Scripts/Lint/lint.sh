#!/usr/bin/env bash

ROOT_PATH=$1
GIT_ROOT=$(git rev-parse --show-toplevel)
LINT_DIR=$GIT_ROOT/Scripts/Lint

if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftlint >/dev/null; then
  swiftlint --config $LINT_DIR/.swiftlint.yml --quiet $ROOT_PATH/Sources
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi