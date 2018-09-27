#!/bin/bash
set -e

export GF_LOG_MODE="console"
export GF_PATHS_DATA="/data"
mkdir -p "$GF_PATHS_DATA"

./run.sh
