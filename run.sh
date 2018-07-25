#!/bin/bash

set -e
set -x

export GF_LOG_MODE="console"
export GF_PATHS_DATA="/data"
export GF_PATHS_PROVISIONING="/provisioning"

export GF_PATHS_HOME="/usr/share/grafana"
export GF_PATHS_PLUGINS="/var/lib/grafana/plugins"
export GF_PATHS_CONFIG="/etc/grafana/grafana.ini"

mkdir -p "$GF_PATHS_PROVISIONING/datasources"
mkdir -p "$GF_PATHS_PROVISIONING/dashboards"
mkdir -p "$GF_PATHS_DATA"

echo "Starting Grafana Server..."
grafana-server --homepath="$GF_PATHS_HOME" --config="$GF_PATHS_CONFIG"