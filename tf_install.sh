#!/bin/bash

brew update
brew install tfenv
tfenv install latest

LATEST_VERSION=$(tfenv list \
 | grep -vP '\d.\d{0,2}.\d{0,2}-.*' \
 | head -1
)

tfenv use "${LATEST_VERSION}"
