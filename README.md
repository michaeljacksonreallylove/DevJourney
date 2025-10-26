# README

# 📘 DevJourney — 学びを記録し、共有し、成長を実感する学習支援アプリ

**DevJourney** は、プログラミング学習者のための Web アプリケーションです。  
自分の学習記録を可視化し、他のユーザーとおすすめ教材を共有し、AI から学習アドバイスを受けることができます。  
さらにユーザー同士でDMを通して学びを深められる、コミュニティ型の学習支援プラットフォームです。

---

## 🚀 主な機能

### 🕒 学習記録（Study Logs）
- 学習開始・終了時間、カテゴリ、内容を記録  
- 学習時間を自動計算し、累計学習時間（`total_study_time`）を更新  
- 週・月単位で学習推移をグラフ表示（Chart.js 対応予定）  
- 他ユーザーからのコメント（`comments_on_study_logs`）機能付き

---

### 📚 教材共有（Recommendations）
- 書籍・動画・記事・企業研修教材など、学習に役立つリソースを投稿可能  
- タイトル、URL、説明、カテゴリを登録  
- 他ユーザーからコメント・いいね（`likes`）を獲得できる  
- 教材別にコメント欄（`comments_on_recommendations`）を持ち、意見交換が可能  

---

### ❤️ いいね機能（Likes）
- 投稿された教材に「いいね」を付けられる  
- 人気教材ランキングに反映  

---

### 💬 コメント機能（Comments）
- 教材・学習記録それぞれにコメント可能  
- `comments_on_recommendations` / `comments_on_study_logs` の2種で管理  
- 論理削除対応（`is_deleted` カラムあり）

---

### 🤖 AI機能（AI Advisor / AI Recommender）
AI が学習データや教材を解析し、学びをサポートします。

#### 🧠 AI学習アドバイザー
- ユーザーの直近7日間の学習ログ（`study_logs`）を解析し、  
  学習傾向や改善点を自然言語でフィードバック  
- OpenAI API（`ruby-openai`）を使用  

#### 📚 AI教材レコメンダー
- ユーザーが入力したキーワードをもとに、  
  AIが関連性の高い教材（`recommendations`）を選び、理由付きで紹介  

---

### ✉️ DM機能（Direct Messages）
- ユーザー同士で個別チャットができるDM機能  
- 構造：`Room` + `RoomUser` + `Message`  
- 既読フラグ（`is_read`）付き  
- 将来的に「AIアドバイザーとのDM相談」も実装予定  

---

### 👤 ユーザープロフィール
- 名前、自己紹介、学習目標、SNSリンク（GitHub / X）を登録可能  
- プロフィール画像（`avatar`）をURLまたはActiveStorageで保存  
- 最終ログイン日時（`last_login_at`）とログイン回数（`login_count`）を記録  

---

## 🧱 データベース設計

| テーブル名 | 主なカラム | 概要 |
|-------------|-------------|------|
| **users** | name, email, password_digest, avatar, total_study_time, last_login_at, login_count | ユーザー情報 |
| **study_logs** | user_id, start_time, end_time, category, description, study_time, is_deleted | 学習記録 |
| **recommendations** | user_id, title, url, comment, category, likes_count, is_deleted | 教材投稿 |
| **comments_on_recommendations** | user_id, recommendation_id, content, is_deleted | 教材コメント |
| **comments_on_study_logs** | user_id, study_log_id, content, is_deleted | 学習記録コメント |
| **likes** | user_id, recommendation_id | いいね |
| **ai_feedbacks** | user_id, content, category | AIアドバイス保存 |
| **ai_search_logs** | user_id, keyword, ai_response | AI検索履歴 |
| **rooms** | id | DMルーム |
| **room_users** | user_id, room_id | ルーム参加者 |
| **messages** | room_id, user_id, content, is_read | DMメッセージ |

---

## 🧩 ER 図

