class AddIndexToMokumokuSessions < ActiveRecord::Migration[8.0]
  def change
    add_index :mokumoku_sessions, [ :creator_user_id, :expired_at ]
  end
end
