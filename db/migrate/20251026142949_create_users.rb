class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string   :email, null: false, default: "", comment: "メールアドレス"
      t.string   :devjourney_id, null: false, comment: "DevJourney アカウントID"
      t.string   :encrypted_password, null: false, default: "", comment: "パスワード"
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :name, null: true, comment: "ユーザー名"
      t.text     :introduction, null: true, comment: "自己紹介"
      t.string   :github_url, null: true, comment: "GitHub URL"
      t.boolean  :is_deleted, null: false, default: false, comment: "削除フラグ"

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :devjourney_id, unique: true
    # add_index :users, :confirmation_token,   unique: true
  end
end
