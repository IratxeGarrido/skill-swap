class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show]

  def new
    @profile = Profile.create(user: current_user)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :age, :gender, :address)
  end
end
