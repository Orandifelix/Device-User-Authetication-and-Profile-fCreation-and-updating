class AddFirstNameToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :first_name, :string
  end
end
