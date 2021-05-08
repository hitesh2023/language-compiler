class EnableUuidExtention < ActiveRecord::Migration[6.1]
  def up
    enable_extension "uuid-ossp"
  end

  def down
    disable_extension "uuid-ossp"
  end
end
