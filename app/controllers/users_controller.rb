class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = current_user
    redirect_to root_path unless @user
    groups = @user.groups + @user.owned_groups
    @groups = groups.sort{|a,b| a.name <=> b.name }
  end

  def update
    @user = User.find(params[:id])
    permitted = params.require(:user).permit(:name, :email, :about)
    @user.update(permitted)
    redirect_to user_path @user
  end

end