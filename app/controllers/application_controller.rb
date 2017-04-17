class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#helper method called here , just to make it available for both controllers and views
  include AuthenticationHelper

  private

  def require_login!
    redirect_to root_path, notice: 'You are not logged in!' unless current_user
  end
end
