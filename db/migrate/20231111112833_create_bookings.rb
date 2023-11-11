class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :movingDate
      t.time :movingTime
      t.string :currentAddress
      t.string :destinationAddress
      t.string :propertyType
      t.integer :bedrooms
      t.text :services
      t.integer :crewSize
      t.string :vehicleSize
      t.text :instructions
      t.string :emergencyContactName
      t.string :emergencyContactPhoneNumber
      t.string :relationshipToUser
      t.string :mpesaNumber
      t.string :mpesaCode
      t.boolean :termsAccepted
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
