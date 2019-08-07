class UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
