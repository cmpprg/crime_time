class User::RegisterController < ApplicationController
  def edit; end

  def update
    current_user.update(state: params[:state])
    redirect_to "/user/dashboard"
  end
end
