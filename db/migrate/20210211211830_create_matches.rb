class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.references :venue
      t.references :home_team
      t.references :away_team
      t.integer :home_score
      t.integer :away_acore

      t.timestamps
    end
  end
end
