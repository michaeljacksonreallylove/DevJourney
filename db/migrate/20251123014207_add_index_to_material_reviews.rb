class AddIndexToMaterialReviews < ActiveRecord::Migration[8.0]
  def change
    add_index :material_reviews, :user_id
  end
end
