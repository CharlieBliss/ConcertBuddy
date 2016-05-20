class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_group_email(user,group)
    @user = user
    @group = group
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'successfully created group')
  end

  def user_to_group_email(message, user)
    @user = user
    @group = Group.find(message.group_id)
    @sender = User.find(message.user_id)

    @message = message.content
    mail(to: @user.email, subject: "message from #{@sender.first_name}") unless @user == @sender

  end

end
