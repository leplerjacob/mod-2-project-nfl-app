class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.integer :week
      t.references :venue
      t.references :home_team
      t.references :away_team
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
