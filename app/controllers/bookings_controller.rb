class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index 
    booking = Booking.all 
    render json: booking
  end
  
  def create
     puts "Received params: #{params.inspect}"
    @booking = current_user.bookings.build(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :movingDate, :movingTime, :currentAddress, :destinationAddress,
      :propertyType, :bedrooms,:crewSize,
      :vehicleSize, :instructions, :emergencyContactName,
      :emergencyContactPhoneNumber, :relationshipToUser,
      :mpesaNumber, :mpesaCode, :termsAccepted, services: []
    )
  end
end
