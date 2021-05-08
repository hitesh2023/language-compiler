class AddTimeTakenColumnToCodeRunners < ActiveRecord::Migration[6.1]
  def change
    add_column :code_runners, :time_taken, :string
  end
end
