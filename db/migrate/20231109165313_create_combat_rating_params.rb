class CreateCombatRatingParams < ActiveRecord::Migration[7.0]
  def change
    create_table :combat_rating_params do |t|
      t.string :star_destroyer_version
      t.integer :tie_squadrons
      t.integer :turbolasers
      t.integer :ion_cannons

      t.timestamps
    end
  end
end
