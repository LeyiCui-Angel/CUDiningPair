class AddUniToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uni, :string, index: { unique: true }
  end
end
