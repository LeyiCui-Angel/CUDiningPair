class AddMbitiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mbti, :string
  end
end
