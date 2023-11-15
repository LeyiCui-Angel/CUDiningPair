class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :restaurant, null: false
      t.integer :target_number_of_people
      t.integer :current_number_of_people
      t.datetime :meeting_time

      t.timestamps
    end

    create_table :pairings_users, id: false do |t|
      t.references :pairing, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end



