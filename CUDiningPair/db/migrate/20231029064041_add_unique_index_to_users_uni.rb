class AddUniqueIndexToUsersUni < ActiveRecord::Migration
  def change
    add_index :users, :uni, unique: true
  end
end
