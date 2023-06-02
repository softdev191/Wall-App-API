class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      if @user.email_confirmed
        session[:user_id] = @user.id
        render json: UserSerializer.new(@user), status: :ok
      else
        render json: {
          error: "Please activate your account"
        }
      end
    else
      render json: {
        error: "Invalid Credentials"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: UserSerializer.new(current_user)
    else
      render json: {
        error: "No one logged in"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "successfully logged out"
    }, status: :ok
  end

end
