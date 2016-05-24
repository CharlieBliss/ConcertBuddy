class SessionsController < ApplicationController
  include HTTParty

  def create

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
