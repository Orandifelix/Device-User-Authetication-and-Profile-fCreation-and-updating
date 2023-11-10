class UserSerializer
  include JSONAPI::Serializer
  
  attributes :id, :email, :first_name, :last_name, :phone_number, :created_at

  attribute :created_date do |user|
    user.created_at && user.created_at.strftime('%m/%d/%Y')
  end
  

end
