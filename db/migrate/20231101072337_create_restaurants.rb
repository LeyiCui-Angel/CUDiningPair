class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.decimal :custom_id
      t.string :name
      t.string :location
      t.decimal :rating, precision: 3, scale: 1
      t.decimal :ratingcount
      t.string :cuisine
    end
  end

  def down
    drop_table :restaurants
  end
end