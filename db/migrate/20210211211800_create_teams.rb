class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :state
      t.integer :wins
      t.integer :losses
      t.string :division

      t.timestamps
    end
  end
end
