class SessionsController < ApplicationController
  def create
    user = User.find_by(uid: gather_uid)
    if user
      session[:user_id] = user.id
      redirect_to '/user/dashboard'
    else
      new_user = User.create(user_params)
      session[:user_id] = new_user.id
      redirect_to "/user/register_state/#{new_user.id}/edit"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have left. Goodbye!"
    redirect_to "/"
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
