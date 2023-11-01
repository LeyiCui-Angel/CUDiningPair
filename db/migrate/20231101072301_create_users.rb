class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: :cascade do |t|
      t.string   :name
      t.string   :email,              null: false
      t.string   :uni,                null: false
      t.datetime :verified_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :verification_code
      t.string   :password_digest
    end

    add_index :users, :uni, unique: true
  end
end
