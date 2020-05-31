class SessionsController < ApplicationController
  def create
    does_user_exist ? login_registered_user : create_and_login_new_user
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

  def create_and_login_new_user
    user = User.create(user_params)
    login_and_redirect(user)
  end

  def login_registered_user
    user = User.find_by(uid: gather_uid)
    login_and_redirect(user)
  end

  def does_user_exist
    User.exists?(uid: gather_uid)
  end

  def login(user)
    session[:user_id] = user.id
  end

  def redirect(user)
    redirect_to "/user/register_state/#{user.id}/edit" unless user.has_state?
    redirect_to '/user/dashboard' if user.has_state?
  end

  def login_and_redirect(user)
    login(user)
    redirect(user)
  end
end
