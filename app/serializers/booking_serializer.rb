# app/serializers/booking_serializer.rb
class BookingSerializer
  include JSONAPI::Serializer
  attributes :id, :movingDate, :movingTime, :currentAddress, :destinationAddress, :propertyType, :bedrooms, :services, :crewSize, :vehicleSize, :instructions, :emergencyContactName, :emergencyContactPhoneNumber, :relationshipToUser, :mpesaNumber, :mpesaCode, :termsAccepted

  belongs_to :user
end


