class SessionsController < ApplicationController
  def create
    User.create({
      uid: request.env["omniauth.auth"]["uid"],
      first_name: request.env["omniauth.auth"]["info"]["first_name"],
      last_name: request.env["omniauth.auth"]["info"]["last_name"],
      email: request.env["omniauth.auth"]["info"]["email"]
    })
    redirect_to '/'
  end
end
