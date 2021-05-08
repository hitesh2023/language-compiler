class AddIndexOnSessionIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_index :code_runners, :session_id
  end
end
