class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show]

  def index
    @profiles = Profile.where.not(user_id: current_user)
    @profiles = @profiles.reject { |profile| profile.is_match?(current_user.profile) }

    # match filter rejected or accept and pendint where Im initiator
    # I need to show all profiles that I dont have a match
    # i need to see the ones im a creator

    if params[:search]
      if params[:search][:skill].empty?
        @query = params[:search][:distance]
        @profiles = Profile.near(current_user.profile.address, @query)
        @profiles = @profiles.reject { |profile| profile.is_match?(current_user.profile) }


      else
        @query = params[:search][:skill]
        @results = Profile.excluding(current_user.profile)
                    .joins(:offers)
                    .where(offers: { category: @query })
                    .distinct
        @profiles = @results.near(current_user.profile.address, params[:search][:distance])
        @profiles = @profiles.reject { |profile| profile.is_match?(current_user.profile) }
      end
    end
    @match = Match.new
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
