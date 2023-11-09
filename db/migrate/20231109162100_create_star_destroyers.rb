class CreateStarDestroyers < ActiveRecord::Migration[7.0]
  def change
    create_table :star_destroyers do |t|
      t.string :name
      t.string :version
      t.float :jump_rating
      t.float :combat_rating
      t.float :interdiction_rating

      t.timestamps
    end
  end
end
