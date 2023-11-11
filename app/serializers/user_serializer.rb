# class UserSerializer
#   include JSONAPI::Serializer
#   attributes :id, :email, :first_name, :last_name, :phone_number, :created_at

#   has_one :profile
#   has_many :bookings


#   attribute :created_date do |user|
#     user.created_at && user.created_at.strftime('%m/%d/%Y')
#   end
# end
# app/serializers/user_serializer.rb
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :first_name, :last_name, :phone_number, :created_at

  has_one :profile
  has_many :bookings, serializer: BookingSerializer

  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
end
