class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :birth_date
      t.integer :age
      t.string :jersey
      t.string :position
      t.string :home_town
      t.string :college
      t.float :weight
      t.float :height
      t.text :bio
      t.references :user
      t.references :team

      t.timestamps
    end
  end
end
