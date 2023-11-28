class OffersController < ApplicationController
  before_action :find_profile, only: [:new, :create]

  def new
    @profile = Profile.find(params[:profile_id])
    @offer = Offer.new
  end

  def create
    @profile = Profile.find(params[:patient_id])
    @offer = Offer.new(offer_params)
    @offer.profile = @profile
    if @offer.save
      redirect_to profile_path(@profile)
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_parmas)
    redirect_to profile_path(@offer.profile)
  end

  def destroy
    @offer.destroy
    redirect_to profiles_path(@profile), status: :see_other
  end

  private
    def offer_parmas
      params.require(:offer).permit(:description, :category)
      #should I add picture here?
    end

    def find_profile
      @profile = Profile.find(params[:patient_id])
    end
end
