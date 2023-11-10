# # frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
   include RackSessionFix

  def create
  # Generate a unique JTI (JSON Web Token Identifier) for the user
  jti = SecureRandom.uuid

  # Create a new user with the generated jti value
  @user = User.new(user_params.merge(jti: jti))

  if @user.save
    @user.create_profile_with_attributes
    render json: {
      status: { code: 200, message: "Signed up successfully." },
      data: UserSerializer.new(@user).serializable_hash[:data][:attributes]
    }, status: :ok
  else
    render json: {
      status: { code: 422, message: "User couldn't be created successfully.", errors: @user.errors.full_messages }
    }, status: :unprocessable_entity
  end
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_number)
  end

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: {code: 200, message: "Signed up sucessfully."},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == "DELETE"
      render json: {
        status: { code: 200, message: "Account deleted successfully."}
      }, status: :ok
    else
      render json: {
        status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end

 