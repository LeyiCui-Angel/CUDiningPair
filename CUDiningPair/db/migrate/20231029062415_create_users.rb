class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true } # Ensure email is unique
      t.string :encrypted_password
      #t.string :verification_code
      t.datetime :verified_at

      t.timestamps
    end
  end
end
