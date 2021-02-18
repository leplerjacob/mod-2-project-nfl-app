class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.float :weight
      t.integer :reps
      t.integer :sets
      t.float :distance
      t.string :duration
      t.references :routine

      t.timestamps
    end
  end
end
