class AddColumnsToCodeRunners < ActiveRecord::Migration[6.1]
  def change
    add_column :code_runners, :code_file_path, :string
    add_column :code_runners, :input_test_file_path, :string
    add_column :code_runners, :language, :string
    add_column :code_runners, :time_limit, :integer
  end
end
