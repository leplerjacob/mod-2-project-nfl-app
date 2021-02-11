class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string 

      t.string :
      t.timestamps
    end
  end
end
