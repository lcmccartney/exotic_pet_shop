class UserNotifier < ActionMailer::Base
  default :from => 'thebeast@fancybeast.io'

  def send_signup_email(user)
    @user = user
    mail(:to => @user.email,
    :subject => 'Welcome to Fancy Beast')
  end
end
