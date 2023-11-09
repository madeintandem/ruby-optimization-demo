class CreateInterdictionRatingParams < ActiveRecord::Migration[7.0]
  def change
    create_table :interdiction_rating_params do |t|
      t.string :star_destroyer_version
      t.integer :gravity_engines
      t.float :max_mass_shadow
      t.float :power_drain

      t.timestamps
    end
  end
end
