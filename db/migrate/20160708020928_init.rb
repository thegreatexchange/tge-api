class Init < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.timestamps
      t.string  :name
      t.string  :email, index: true, unique: true
      t.string  :encrypted_password
      t.string  :encrypted_password_iv
    end

    create_table :authorizations do |t|
      t.timestamps
      t.string :name
      t.string :description
    end

    create_table :user_authorizations do |t|
      t.timestamps
      t.belongs_to :user
      t.belongs_to :authorization
      t.index    [:user_id, :authorization_id]
      t.boolean :is_active, default: true
    end

    create_table :locations do |t|
      t.timestamps
      t.string  :name
      t.string  :country
      t.string  :region
      t.string  :state
      t.string  :city
      t.string  :zip
      t.string  :address
      t.string  :timezone
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
      t.string     :type
      t.belongs_to :school
      t.belongs_to :ministry
      t.string     :name
      t.string     :email
      t.string     :phone_number
      t.boolean    :is_text_enabled
      t.boolean    :is_email_enabled
    end

    create_table :events do |t|
      t.timestamps
      t.belongs_to :location
      t.belongs_to :school
      t.belongs_to :ministry
      t.datetime   :starts_at
      t.datetime   :ends_at
      t.text       :description
    end

    create_table :event_registrations do |t|
      t.timestamps
      t.belongs_to :event
      t.belongs_to :person
      t.text       :comments
    end

    create_table :person_locations do |t|
      t.timestamps
      t.belongs_to :person
      t.belongs_to :location
      t.index      [:person_id, :location_id]
      t.boolean    :is_active, default: true
    end

  end

end
