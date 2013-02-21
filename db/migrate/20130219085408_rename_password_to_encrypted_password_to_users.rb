class RenamePasswordToEncryptedPasswordToUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.rename :password, :encrypted_password
  end
end
