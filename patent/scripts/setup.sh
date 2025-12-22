#!/bin/bash
set -e

PLUGIN_DIR="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$0")")}"
SERVER_DIR="${PLUGIN_DIR}/servers/patent_mcp_server"

# Clone repository if not exists
if [ ! -d "${SERVER_DIR}" ]; then
  echo "Cloning patent_mcp_server..."
  git clone https://github.com/riemannzeta/patent_mcp_server.git "${SERVER_DIR}"
fi

# Install dependencies with uv
cd "${SERVER_DIR}"
echo "Installing dependencies with uv..."
uv sync

echo "Setup complete!"
