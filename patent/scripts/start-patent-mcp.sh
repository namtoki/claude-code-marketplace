#!/bin/bash
set -e

PLUGIN_DIR="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$0")")}"
SERVER_DIR="${PLUGIN_DIR}/servers/patent_mcp_server"

cd "${SERVER_DIR}"
exec uv run patent-mcp-server
