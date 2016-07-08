class Init < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.timestamps
      t.string :email, index: true, unique: true
      t.string :encrypted_password
      t.string :encrypted_password_iv
    end
  end

end
