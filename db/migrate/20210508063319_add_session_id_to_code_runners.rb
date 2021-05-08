class AddSessionIdToCodeRunners < ActiveRecord::Migration[6.1]
  def change
    add_column :code_runners, :session_id, :uuid, default: 'uuid_generate_v4()'
  end
end
