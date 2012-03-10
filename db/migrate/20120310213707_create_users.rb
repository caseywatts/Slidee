class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :auth_type
      t.string :perishable_token
      t.boolean :superuser
      t.boolean :supermode

      t.timestamps
    end
  end
end
