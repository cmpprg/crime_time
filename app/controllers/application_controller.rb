class ApplicationController < ActionController::Base
  helper_method :current_user,
                :compare_path?,
                :search_path?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def compare_path?
    request.path == "/user/compare"
  end

  def search_path?
    request.path == "/user/search"
  end
end
