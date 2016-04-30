class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      respond_to do |format|
        format.json {render json: @user}
        format.html {redirect_to root_path}
      end
    else
      flash[:alert] = "Incorrect email or password"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end