class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :capacity
      t.references :team

      t.timestamps
    end
  end
end
