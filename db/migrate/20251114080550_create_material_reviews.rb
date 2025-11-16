class CreateMaterialReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :material_reviews do |t|
      t.integer :user_id, null: false, comment: "ユーザーID"
      t.string  :title, null: false, comment: "レビュータイトル"
      t.text    :material_url, null: true, comment: "教材URL"
      t.integer :score, null: false, comment: "評価スコア(1~5段階)"
      t.text    :description, null: false, comment: "レビュー内容"
      t.boolean :is_deleted, null: false, default: false, comment: "削除フラグ"
      t.timestamps
    end
  end
end
