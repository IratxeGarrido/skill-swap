class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show]

  def index

#    @profiles = Profile.all
    @profiles = Profile.where.not(user_id: current_user)

    # if params[:search]["offer"].present?
    #   @query = params[:search][:"offer"]
    #   raise
    #   @profiles = Profile.offers_search(@query)
    # end

  end

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

  def edit
    set_profile
  end

  def update
    set_profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show

  end

  def search

  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :age, :gender, :address, :photo)
  end
end
