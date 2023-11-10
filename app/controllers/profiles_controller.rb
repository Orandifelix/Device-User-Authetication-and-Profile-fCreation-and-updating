class ProfilesController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated before accessing profiles

  def index
    profiles = Profile.all
    render json: profiles
  end

  def show
    @profile = current_user.profile
    render json: @profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :address, :fb, :linkedin, :twitter, :age, :first_name, :last_name, :email, :phone_number)
  end
end

