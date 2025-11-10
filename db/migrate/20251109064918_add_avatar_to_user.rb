class AddAvatarToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :avatar, :string, null: true, comment: "アバター画像"
  end
end
