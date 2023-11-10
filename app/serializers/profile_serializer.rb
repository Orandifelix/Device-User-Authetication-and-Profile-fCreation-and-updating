class ProfileSerializer
  include JSONAPI::Serializer
  attributes :bio, :address, :fb, :linkedin, :twitter, :age, :user_id
  belongs_to :user
end
