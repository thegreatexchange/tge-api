class Init < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.timestamps
      t.boolean :super, default: false
      t.string  :name
      t.string  :email, index: true, unique: true
      t.string  :encrypted_password
      t.string  :encrypted_password_iv
    end

    create_table :locations do |t|
      t.timestamps
      t.string :name
      t.string :country
      t.string :state
      t.string :city
    end

    create_table :schools do |t|
      t.timestamps
      t.belongs_to :location
      t.string     :name
    end

    create_table :ministries do |t|
      t.timestamps
      t.belongs_to :location
      t.belongs_to :school
      t.string     :name
    end

    create_table :people do |t|
      t.timestamps
      t.string :type
      t.belongs_to :location
      t.belongs_to :school
      t.belongs_to :ministry
      t.string :name
      t.string :email
      t.string :phone_number
      t.boolean :is_text_enabled
      t.boolean :is_email_enabled
    end

  end

end
