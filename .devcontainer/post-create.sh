#!/usr/bin/env bash
set -euo pipefail

chmod +x .githooks/commit-msg
git config core.hooksPath .githooks
