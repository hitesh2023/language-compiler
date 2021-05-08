class AddStatusColumnToCodeRunners < ActiveRecord::Migration[6.1]
  def change
    add_column :code_runners, :status, :string
  end
end
