class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.references :user_id, null: false, foreign_key: true
      t.string :date
      t.string :location

      t.timestamps
    end
  end
end
