class MessagesController < ApplicationController

  def new
    @user = current_user
    @group = Group.find(params[:group])
    @message = Message.new
  end

  def create

    message = Message.new(message_params)
    message.user_id = current_user.id

    if message.save
      group = Group.find(message.group_id)
      owner = User.find(group.owner_id)

      group.users.each do |user|
        UserMailer.user_to_group_email(message, user).deliver_now unless user.id == message.user_id
      end

      UserMailer.user_to_group_email(message, owner).deliver_now unless owner.id == message.user_id

      redirect_to root_path
    else
      flash[:notice] = message.errors.full_messages
      redirect_to :back
    end
  end

  private

  def message_params
    params.require(:message).permit(:content,:group_id)
  end

end
