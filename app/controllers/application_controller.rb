class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :create_profile

  def after_sign_in_path_for(resource_or_scope)
    profile = Profile.where("user_id = #{current_user.id}")
    if profile.empty?
      new_profile_path
    else
      profiles_path
    end
  end

  def create_profile
    @profile = Profile.where("user_id = #{current_user.id}").first if user_signed_in?
  end
end
