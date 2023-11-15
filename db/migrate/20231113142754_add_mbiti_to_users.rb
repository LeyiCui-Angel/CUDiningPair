class AddMbitiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mbti, :int
  end
end
