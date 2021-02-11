class CreateStadia < ActiveRecord::Migration[6.1]
  def change
    create_table :stadia do |t|

      t.timestamps
    end
  end
end
