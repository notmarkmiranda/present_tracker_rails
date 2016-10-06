class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "you're logged in!"
      redirect_to user_dashboard_path
    else
      flash.now[:danger] = "something went wrong!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "logged out!"
    redirect_to root_path
  end
end
