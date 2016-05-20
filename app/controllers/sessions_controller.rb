class SessionsController < ApplicationController
  include HTTParty

  def new
    @user = User.new
  end

  # to use this redirect_to at some point before or after user creation"/sessions/spotify_request"
  # def spotify_request
  #   auth_url = Authorize.authorize_url
  #   redirect_to auth_url
  # end


  # def spotify_callback

  #   response = Authorize.spotify_token_response(params["code"])
  #   user = User.find(session[:user])
  #   user.update_attributes(access_token: response["access_token"],
  #     refresh_token: response["refresh_token"], token_create_time: Time.now)

  #   redirect_to root_path
  # end

  def create
    binding.pry
  if User.from_omniauth(auth)
      user = User.sign_in_from_omniauth(auth)
      session[:user_id] = user.id

      respond_to do |format|
        format.json {render json: @user}
        format.html {redirect_to "/eventbrite/events"}
      end
  else

    user = User.create_user_from_omni_auth(auth)
    session[:user_id] = user.id

    respond_to do |format|
      format.json {render json: @user}
      format.html {redirect_to edit_user_path(user.id)}
    end

  end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end