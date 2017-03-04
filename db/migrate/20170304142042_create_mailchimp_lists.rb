class CreateMailchimpLists < ActiveRecord::Migration[5.0]
  def change
    create_table :mailchimp_lists do |t|
      t.timestamps
      t.belongs_to :organization
      t.string     :mailchimp_id
      t.string     :name
    end
  end
end
