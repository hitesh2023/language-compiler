class CreateCodeRunners < ActiveRecord::Migration[6.1]
  def change
    create_table :code_runners do |t|

      t.timestamps
    end
  end
end
