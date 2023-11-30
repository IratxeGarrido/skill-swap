class OffersController < ApplicationController
  before_action :find_profile, only: [:new, :create, :show]

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.profile = @profile
    if @offer.save
      redirect_to profile_path(@profile)
    end
  end

  def show
    @offers = Offer.where(profile_id: @profile.id)
  end

  def edit
    @offer = Offer.find(params[:id])
    @profile = @offer.profile
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to profile_path(@offer.profile)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @profile = @offer.profile
    @offer.destroy
    redirect_to profile_path(@profile), notice: 'Offer was successfully deleted.'
  end

  private
    def offer_params
      params.require(:offer).permit(:description, :category, :photo)
      #should I add picture here?
    end

    def find_profile
      @profile = Profile.find(params[:profile_id])
    end
end
