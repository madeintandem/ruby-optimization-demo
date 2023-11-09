class CreateJumpRatingParams < ActiveRecord::Migration[7.0]
  def change
    create_table :jump_rating_params do |t|
      t.string :star_destroyer_version
      t.float :motivator_power
      t.float :cronau_factor
      t.float :mass_shadow

      t.timestamps
    end
  end
end
