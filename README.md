# MyAutoDiary 🌙🐾

ズボラなあなたに代わって、PCの操作ログとDiscordのつぶやきから、AIが1日の日記を自動生成するローカルWebアプリケーションです。

## ✨ 特徴

* **📊 ログ自動集計**: ActivityWatchでPC操作時間、Discordから日々のつぶやきを取得。
* **🛡️ プライバシー保護**: 特定アプリやメアドを自動で匿名化。さらに、AIへ送信する前に画面上で**ログを直接手動で編集・削除**できます。
* **🤖 AI自動執筆**: ログと天候データを統合し、Geminiが自然な一人称の日記を作成。
* **🔗 Obsidian完全対応**: 重要キーワードを自動で `[[ ]]` リンク化。
* **🦉 夜更かし対応**: 午前3時までの活動は「前日の日記」として扱います。

## 💸 API料金とプライバシーについて
* **無料運用が可能**: Gemini API（Google AI Studio）の無料枠内で十分に運用可能です（1日1回程度の実行を想定）。
* **プライバシーの注意**: 無料枠のAPIはGoogleの学習に利用される可能性があります。絶対に外部に漏らしたくない機密情報等は、送信前の画面でログから削除してください。

## 🚀 セットアップ

**【必要なもの】**
* [uv](https://github.com/astral-sh/uv) (Pythonパッケージマネージャー)
* [ActivityWatch](https://activitywatch.net/) (ローカルで起動しておく)
* Gemini APIキー ([Google AI Studio](https://aistudio.google.com/) から取得)
* *(任意)* Discord Botトークン & チャンネルID

**【インストールと設定】**
```bash
git clone [https://github.com/chizrosa/MyAutoDiary.git](https://github.com/chizrosa/MyAutoDiary.git)
cd MyAutoDiary
uv sync
cp .env.example .env
```
👉 作成された `.env` ファイルに、取得したAPIキー等を設定してください。（※`.env`は絶対に公開しないでください）

**💡 Discord連携を行う場合 (任意)**
1. [Developer Portal](https://discord.com/developers/applications) でBotを作成しトークンを取得。
2. Botを自分用の非公開サーバーに招待。
3. Discordの「詳細設定 ＞ 開発者モード」をオンにし、対象チャンネルを右クリックしてIDをコピー。
4. `.env` にトークンとIDを追記します。

## 🛠 使い方

以下のコマンド（または作成したバッチファイル）で起動します。
```bash
uv run streamlit run main.py
```

1. カレンダーから日付を選び **「✨ データを集計」** をクリック。
2. プレビューを確認し、**AIに見られたくないログがあればここで直接削除・修正**します（追記も可能）。
3. **「🌟 AIに日記を書いてもらう」** で日記を生成。
4. **「💾 ファイルに保存する」** でMarkdown形式で保存されます！
   * *(💡 保存されたファイルの上部には「AI日記」、下部にはAIに送らなかったデータも含めた「生ログ全件」がローカル専用の記録として残ります)*

## 🔗 Obsidianユーザーの方へ
`.env` ファイル内の `SAVE_DIR` をご自身のVault（保管庫）の絶対パスに変更するだけで、ボタン1つで直接Obsidian内に日記が保存されるようになります。

## ⚠️ 免責事項
本ツールは個人開発のプロジェクトです。AIの性質上、事実と異なる内容が生成される可能性があります。万が一のデータ消失やAPIの意図せぬ課金等について開発者は責任を負いかねますので、適宜バックアップを取り、自己責任の範囲でご活用ください。

## 📄 ライセンス / 🤝 開発について
* This project is licensed under the MIT License.
* コードの大部分は、AIアシスタント（Gemini）とのペアプログラミングによって作成されました。