class User::BaseController < ApplicationController
  before_action :require_login

  def require_login
    render file: "/public/404" unless current_user
  end
end