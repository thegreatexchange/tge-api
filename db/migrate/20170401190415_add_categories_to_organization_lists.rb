class AddCategoriesToOrganizationLists < ActiveRecord::Migration[5.0]
  def change
    add_column :organization_lists, :categories, :json
  end
end
