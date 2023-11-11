class Booking < ApplicationRecord
  belongs_to :user

  SERVICES_OPTIONS = ['Commercial', 'Residential', 'Long Distance', 'Local', 'Packing', 'Unpacking', 'Storage', 'Furniture Disassembly', 'Furniture Assembly']

  validates :movingDate, presence: true
  validates :movingTime, presence: true
  validates :currentAddress, presence: true
  validates :destinationAddress, presence: true
  validates :propertyType, inclusion: { in: ['Office', 'Apartment', 'House'], message: "must be 'Office', 'Apartment', or 'House'" }
  validates :bedrooms, presence: true
  validates :services, presence: true, inclusion: { in: SERVICES_OPTIONS, message: "must be one or more of #{SERVICES_OPTIONS.join(', ')}" }
  validates :crewSize, presence: true
  validates :vehicleSize, inclusion: { in: ['Car', 'Van', 'Bus', 'Truck', 'Trailer'], message: "must be 'Car', 'Van', 'Bus', 'Truck', or 'Trailer'" }
  validates :emergencyContactName, presence: true
  validates :emergencyContactPhoneNumber, presence: true
  validates :relationshipToUser, presence: true
  validates :mpesaNumber, presence: true
  validates :mpesaCode, presence: true
  validates :termsAccepted, acceptance: { accept: true, message: 'must be accepted' }

  
end
