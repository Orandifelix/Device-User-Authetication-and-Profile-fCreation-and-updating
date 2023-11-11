# class Booking < ApplicationRecord
#   belongs_to :user, dependent: :destroy

#   SERVICES_OPTIONS = ['Commercial', 'Residential', 'Long Distance', 'Local', 'Packing', 'Unpacking', 'Storage', 'Furniture Disassembly', 'Furniture Assembly']

#   validates :movingDate, presence: true
#   validates :movingTime, presence: true
#   validates :currentAddress, presence: true
#   validates :destinationAddress, presence: true
#   validates :propertyType, inclusion: { in: ['Office', 'Apartment', 'House'], message: "must be 'Office', 'Apartment', or 'House'" }
#   validates :bedrooms, presence: true
#   # validates :services, presence: true, inclusion: { in: SERVICES_OPTIONS, message: "must be one or more of #{SERVICES_OPTIONS.join(', ')}", case_sensitive: false }

#   validates :crewSize, presence: true
#   validates :vehicleSize, inclusion: { in: ['Car', 'Van', 'Bus', 'Truck', 'Trailer'], message: "must be 'Car', 'Van', 'Bus', 'Truck', or 'Trailer'" }
#   validates :emergencyContactName, presence: true
#   validates :emergencyContactPhoneNumber, presence: true
#   validates :relationshipToUser, presence: true
#   validates :mpesaNumber, presence: true
#   validates :mpesaCode, presence: true
#   validates_acceptance_of :termsAccepted, accept: true, message: 'must be accepted'
# end

class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy

  SERVICES_OPTIONS = ['Commercial', 'Residential', 'Long Distance', 'Local', 'Packing', 'Unpacking', 'Storage', 'Furniture Disassembly', 'Furniture Assembly']

  validates :movingDate, presence: true
  validates :movingTime, presence: true
  validates :currentAddress, presence: true
  validates :destinationAddress, presence: true
  validates :propertyType, inclusion: { in: ['Office', 'Apartment', 'House'], message: "must be 'Office', 'Apartment', or 'House'" }
  validates :bedrooms, presence: true
  validate :validate_services
  validates :crewSize, presence: true
  validates :vehicleSize, inclusion: { in: ['Car', 'Van', 'Bus', 'Truck', 'Trailer'], message: "must be 'Car', 'Van', 'Bus', 'Truck', or 'Trailer'" }
  validates :emergencyContactName, presence: true
  validates :emergencyContactPhoneNumber, presence: true
  validates :relationshipToUser, presence: true
  validates :mpesaNumber, presence: true
  validates :mpesaCode, presence: true
  validates_acceptance_of :termsAccepted, accept: true, message: 'must be accepted'

  before_validation :parse_services

  private

  def parse_services
    self.services = JSON.parse(services) if services.is_a?(String)
  rescue JSON::ParserError
    errors.add(:services, 'is not a valid JSON array')
  end

   def validate_services
  services_array = services.is_a?(Array) ? services : JSON.parse(services)
  unless (services_array - SERVICES_OPTIONS).empty?
    errors.add(:services, "must be one or more of #{SERVICES_OPTIONS.join(', ')}")
  end
rescue JSON::ParserError
  errors.add(:services, 'is not a valid JSON array')
end

end
