class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.string :user_name
      t.decimal :rating, precision: 3, scale: 1
      t.decimal :rating_count, precision: 5, scale: 2  # Example precision and scale
      t.text :comment

      t.timestamps null: false
    end
  end
end
