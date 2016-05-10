class UsersController < ApplicationController

  # def new
  #   @user = User.new
  # end

  # def create

  #   user = User.new(user_params)
  #   if user.save
  #     redirect_to "auth/eventbrite"
  #   else
  #     redirect_to new_user_path
  #   end
  # end


  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    groups = @user.groups + @user.owned_groups

    @groups = groups.sort{|a,b| a.name <=> b.name }
  end

  def something
    binding.pry
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    permitted = params.require(:user).permit(:name, :email, :about)
    @user.update(permitted)
    redirect_to user_path @user
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :about)
  # end
end