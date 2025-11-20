class CreateMokumokuSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :mokumoku_sessions do |t|
      t.integer   :creator_user_id, null: false, comment: "もくもく会作成者のユーザーID"
      t.string    :title, null: false, comment: "もくもく会タイトル"
      t.text      :description, null: true, comment: "もくもく会説明"
      t.text      :session_url, null: false, comment: "もくもく会URL"
      t.datetime  :expired_at, null: false, comment: "もくもく会投稿表示期限"
      t.boolean   :is_deleted, null: false, default: false, comment: "削除フラグ"
      t.timestamps
    end
  end
end
