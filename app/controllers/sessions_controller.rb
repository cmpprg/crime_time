class SessionsController < ApplicationController
  def create
    if User.find_by(uid: gather_uid)
      redirect_to '/user/dashboard'
    else
      User.create(user_params)
      redirect_to '/user/register_state'
    end
  end

  private

  def user_params
    {
    uid: gather_uid,
    first_name: gather_first_name,
    last_name: gather_last_name,
    email: gather_email
    }
  end

  def gather_uid
    request.env["omniauth.auth"]["uid"]
  end

  def gather_first_name
    request.env["omniauth.auth"]["info"]["first_name"]
  end

  def gather_last_name
    request.env["omniauth.auth"]["info"]["last_name"]
  end

  def gather_email
    request.env["omniauth.auth"]["info"]["email"]
  end
end
