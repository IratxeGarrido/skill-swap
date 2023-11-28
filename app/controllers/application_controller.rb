class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource_or_scope)
    redirect_to edit_profile_path(current_user.profile)
  end
end
