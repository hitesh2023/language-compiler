class AddOutputTestFilePathColumnToCodeRunners < ActiveRecord::Migration[6.1]
  def change
    add_column :code_runners, :output_test_file_path, :string
  end
end
