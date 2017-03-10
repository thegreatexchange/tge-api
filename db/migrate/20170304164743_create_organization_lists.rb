class CreateOrganizationLists < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_lists do |t|
      t.timestamps
      t.belongs_to :organization, index: true
      t.string     :mailchimp_list_id
    end
  end
end
