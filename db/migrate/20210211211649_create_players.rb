class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.integer :age
      t.float :weight
      t.float :height
      t.string :position
      t.string :home_state
      t.string :school
      t.text :bio
      t.timestamps
    end
  end
end
