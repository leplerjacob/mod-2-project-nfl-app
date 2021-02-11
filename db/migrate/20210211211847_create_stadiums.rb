class CreateStadiums < ActiveRecord::Migration[6.1]
  def change
    create_table :stadiums do |t|
      t.string :city
      t.string :state
      t.integer :capacity

      t.timestamps
    end
  end
end
