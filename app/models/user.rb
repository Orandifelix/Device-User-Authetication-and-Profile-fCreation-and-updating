class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :bookings, dependent: :destroy
  before_create :create_profile_with_attributes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

         

  public

  def create_profile_with_attributes
    build_profile(
      first_name: self.first_name,
      last_name: self.last_name,
      email: self.email,
      phone_number: self.phone_number,
      bio: nil,
      address: nil,
      fb: nil,
      linkedin: nil,
      twitter: nil,
      age: nil,
      # user_id: self.id     #Set user_id to be the same as user's id
    ).save
  end
end
