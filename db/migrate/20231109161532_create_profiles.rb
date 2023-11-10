class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio
      t.string :address
      t.string :fb
      t.string :linkedin
      t.string :twitter
      t.integer :age

      t.timestamps
    end
  end
end
