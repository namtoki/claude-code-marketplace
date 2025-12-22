# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Claude Code Plugin Marketplace. Register this marketplace in `~/.claude/settings.json` to make plugins available globally.

## Repository Structure

```
claude-code-marketplace/
├── .claude-plugin/
│   └── marketplace.json      # Marketplace definition (name, owner, plugins list)
├── patent/                   # patent-assistant plugin
│   ├── .claude-plugin/
│   │   └── plugin.json       # Plugin manifest (mcpServers, hooks)
│   ├── commands/
│   │   └── patent.md         # /patent command
│   ├── agents/               # Multi-agent workflow
│   │   ├── patent_input.md
│   │   ├── patent_secretary.md
│   │   ├── patent_searcher.md
│   │   ├── patent_analyzer.md
│   │   ├── patent_adviser.md
│   │   ├── patent_document.md
│   │   └── patent_auditor.md
│   ├── skills/
│   │   └── patent-guide/
│   │       └── SKILL.md      # Patent law knowledge base
│   ├── scripts/
│   │   ├── setup.sh          # Auto-setup: git clone + uv sync
│   │   └── start-patent-mcp.sh   # MCP server launcher
│   └── servers/              # patent_mcp_server clone destination
├── README.md
├── LICENSE
└── CLAUDE.md
```

## Marketplace Configuration

In `~/.claude/settings.json`:
```json
{
  "extraKnownMarketplaces": {
    "namtoki-plugins": {
      "source": {
        "source": "github",
        "repo": "namtoki/claude-code-marketplace"
      }
    }
  }
}
```

## Adding New Plugins

1. Create a new directory at the root (e.g., `my-plugin/`)
2. Add `.claude-plugin/plugin.json` with manifest
3. Add commands, agents, skills as needed
4. Register in `.claude-plugin/marketplace.json` under `plugins` array:
   ```json
   {
     "name": "my-plugin",
     "source": "./my-plugin",
     "description": "...",
     "version": "1.0.0"
   }
   ```

## Patent Assistant Plugin

Multi-agent workflow for Japanese patent law invention creation:

1. **patent_input** - Analyzes user input, extracts keywords
2. **patent_searcher** - Searches patent databases for prior art
3. **patent_analyzer** - Analyzes novelty and inventive step
4. **patent_adviser** - Suggests improvements if novelty lacking (loops back)
5. **patent_document** - Drafts patent application documents
6. **patent_auditor** - Final audit

**patent_secretary** manages meeting notes throughout.

### MCP Servers (Auto-installed)

- **sequential-thinking**: Installed via npx on plugin activation
- **patent_mcp_server**: Cloned from GitHub and installed via `uv sync` on SessionStart hook

Environment variable required: `USPTO_API_KEY`
