class Init < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.timestamps
      t.string :email, index: true, unique: true
      t.string :password
    end
  end

end
