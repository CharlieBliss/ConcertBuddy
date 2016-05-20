class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_group_email(user,group)
    @user = user
    @group = group
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'successfully created group')
  end

  def user_to_group_email(message)
    @group = Group.find(message.group_id)
    @sender = User.find(message.user_id)
    @message = message.content

    @group.users.each do |user|
      mail(to: user.email, subject: "message from #{@sender.first_name}")
    end
  end

end
