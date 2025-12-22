# Claude Code Plugin Marketplace

Personal Claude Code Plugin Marketplace.

## Marketplace Registration

Add the following to `.claude/settings.json` (project-level) or `~/.claude/settings.json` (global):

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

---

## Plugins

### Patent Assistant

A plugin for Japanese patent law-based invention creation support.

#### Prerequisites

- **uv** (Python package manager)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- **USPTO_API_KEY** environment variable

```bash
export USPTO_API_KEY=your_api_key_here
```

#### Installation

Launch Claude Code and run:

```
/plugin install patent-assistant@namtoki-plugins
```

> **Note**: There is no automatic plugin installation. Even after registering the Marketplace, you must manually install plugins.

After installation, the following MCP servers are automatically set up:

| Server | Purpose | Setup |
|--------|---------|-------|
| sequential-thinking | Reasoning framework | Auto (npx) |
| patent_mcp_server | Patent database search | Auto (git clone + uv sync) |

#### Usage

```
/patent-assistant:run <problem or problem with proposed solution>
```

#### Example

```
/patent-assistant:run Signal processing method to solve unstable Bluetooth earphone connection issues
```

#### Agent Configuration

| Agent | Role |
|-------|------|
| patent_input | Input analysis & keyword extraction |
| patent_secretary | Meeting notes management |
| patent_searcher | Patent database search |
| patent_analyzer | Component analysis & novelty assessment |
| patent_adviser | Improvement suggestions & user dialogue |
| patent_document | Application document drafting |
| patent_auditor | Final audit |

#### Workflow

```
User Input
    ↓
patent_input (Input Analysis)
    ↓
patent_searcher (Patent Search)
    ↓
patent_analyzer (Analysis & Novelty Assessment)
    ↓
├─ Novelty exists → patent_document → patent_auditor → Complete
└─ No novelty → patent_adviser → patent_input (Loop)
```

---

## License

MIT License

## Author

[@namtoki](https://github.com/namtoki)
