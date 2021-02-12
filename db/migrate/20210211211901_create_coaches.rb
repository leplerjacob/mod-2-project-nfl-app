class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :bio
      t.string :position
      t.references :team

      t.timestamps
    end
  end
end
