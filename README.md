# Claude Code Plugin Marketplace

個人用の Claude Code Plugin Marketplace です。

## Marketplace の登録

プロジェクトごとに使用する場合は `.claude/settings.json` に、グローバルに使用する場合は `~/.claude/settings.json` に以下を追加:

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

## プラグイン一覧

### Patent Assistant

日本特許法に基づく発明作成を支援するプラグインです。

#### 前提条件

- **uv** (Python パッケージマネージャー)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- **USPTO_API_KEY** 環境変数

```bash
export USPTO_API_KEY=your_api_key_here
```

#### インストール

Claude Code を起動し、以下のコマンドを実行:

```
/plugin install patent-assistant@namtoki-plugins
```

> **注意**: プラグインの自動インストール機能は現在ありません。Marketplace を登録しても、プラグインは手動でインストールする必要があります。

プラグインをインストールすると、以下の MCP サーバーが自動的にセットアップされます:

| サーバー | 用途 | セットアップ |
|----------|------|-------------|
| sequential-thinking | 推論フレームワーク | 自動（npx） |
| patent_mcp_server | 特許データベース探索 | 自動（git clone + uv sync） |

#### 使い方

```
/patent-assistant:run <課題または課題と改善手法提案>
```

#### 例

```
/patent-assistant:run Bluetoothイヤホンの接続が不安定な問題を解決するための信号処理手法
```

#### エージェント構成

| エージェント | 役割 |
|-------------|------|
| patent_input | 入力分析・キーワード抽出 |
| patent_secretary | 議事録管理 |
| patent_searcher | 特許データベース探索 |
| patent_analyzer | 構成要素分析・新規性判断 |
| patent_adviser | 改善提案・ユーザ対話 |
| patent_document | 出願書類作成 |
| patent_auditor | 最終監査 |

#### 処理フロー

```
ユーザ入力
    ↓
patent_input（入力分析）
    ↓
patent_searcher（特許探索）
    ↓
patent_analyzer（分析・新規性判断）
    ↓
┌─ 新規性あり → patent_document → patent_auditor → 完了
└─ 新規性なし → patent_adviser → patent_input（ループ）
```

---

## ライセンス

MIT License

## 作者

[@namtoki](https://github.com/namtoki)
