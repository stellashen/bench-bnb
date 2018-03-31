class Api::SessionsController < ApplicationController
  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # Flash errors, if any.
    # Render :new if invalid credentials (give the user another chance to login)
    if @user.nil?
      render plain: "invalid credentials", status: 422
    else
      login!(@user)
      render plain: "Logged in!"
    end
  end

  def destroy
    puts current_user
    if current_user
      logout!
      render json: {}
    else
      render plain: "no logged-in user", status: 404
    end
  end
end
