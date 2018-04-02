class Api::SessionsController < ApplicationController
  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])
    # Flash errors, if any.
    # Render :new if invalid credentials (give the user another chance to login)
    if @user
      login!(@user)
      render plain: "Logged in!"
    else
      render jason: ["invalid credentials"], status: 422
    end
  end

  def destroy
    @user = current_user
    if @user
      logout!
      render "api/users/show"
    else
      render json: ["no logged-in user"], status: 404
    end
  end
end
