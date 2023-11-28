class ProfilesController < ApplicationController
  # before_action :set_profile, only: %i[edit]

  def edit
    @profile = Profile.create(user: current_user)
  end

  def update
  #   @answer = params[:commit]
  #   @booking = Booking.find(params[:id])

  #   if @answer == "reject"
  #     @booking.rejected!

  #   elsif @answer == "accept"
  #     @booking.accepted!
  #   end
  #   redirect_to booking_path
  end

  private

  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end

  def profile_params
    params.require(:profile).permit(:bio, :age, :gender, :address)
  end
end
