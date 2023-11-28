class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
    @profile = Profile.where("user_id = #{current_user.id}")
    if @profile.empty?
      new_profile_path
    else
      profiles_path
    end
  end
end
