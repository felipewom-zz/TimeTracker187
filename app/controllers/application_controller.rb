class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception
  before_filter :authenticate_user!
  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
