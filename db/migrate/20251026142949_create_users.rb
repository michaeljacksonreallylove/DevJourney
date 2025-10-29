class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: "ユーザー名"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"
      t.text :introduction, null: true, comment: "自己紹介"
      t.string :github_url, null: true, comment: "GitHub URL"
      t.integer :sign_in_count, default: 0, null: false, comment: "サインイン回数"
      t.datetime :last_sign_in_at, null: true, comment: "最終サインイン日時"
      t.boolean :is_deleted, null: false, default: false, comment: "削除フラグ"

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end