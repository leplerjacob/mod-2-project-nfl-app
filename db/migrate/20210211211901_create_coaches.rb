class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :name
      t.integer :age
      t.text :bio
t.references :team

      t.timestamps
    end
  end
end
