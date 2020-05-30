class SessionsController < ApplicationController
  def create
    request.env["omniauth.auth"]["uid"]
    request.env["omniauth.auth"]["info"]["first_name"]
    request.env["omniauth.auth"]["info"]["last_name"]
    request.env["omniauth.auth"]["info"]["email"]
  end
end
