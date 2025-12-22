# patent コマンド

ユーザの入力を patent_input エージェントに投げて、発明作成プロセスを開始します。

## 使用方法

```
/patent <課題または課題と改善手法提案>
```

## 処理フロー

1. patent_input: ユーザ入力を分析し、プロジェクト名を決定
2. patent_searcher: 関連特許を探索
3. patent_analyzer: 特許を分析し、新規性を検討
4. patent_adviser: 発明にならない場合の改善提案（必要に応じて）
5. patent_document: 発明書類を作成
6. patent_auditor: 最終監査

---

$ARGUMENTS を分析して、発明作成プロセスを開始してください。

## 実行手順

1. まず patent_input エージェントとして動作し、入力内容を分析してください：
   - 「課題」だけなのか「課題とそれに対する改善手法提案」なのかを判断
   - 関連する技術分野、キーワードをリスト化
   - プロジェクト名を決定（例: patent_bluetooth_smoother）

2. patent_secretary エージェントとして、プロジェクトフォルダを作成し、議事録を管理してください

3. 各エージェントの処理結果を順次記録しながら、発明作成プロセスを進めてください

4. 必ず `skills/patent-guide/SKILL.md` を参照し、発明の要件を満たしているか確認してください
