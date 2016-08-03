class Init < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.timestamps
      t.boolean    :super, default: false
      t.string     :name
      t.string     :email, index: true, unique: true
      t.string     :encrypted_password
      t.string     :encrypted_password_iv
    end

    create_table :people do |t|
      t.timestamps
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :location
    end

    create_table :notifications do |t|
      t.timestamps
      t.datetime   :sent_at
      t.references :sent_by
      t.references :sent_to, polymorphic: true
      t.json       :data
    end
  end

end
