class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id

    respond_to do |format|
      format.json {render json: @user}
      format.html {redirect_to root_path}
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end