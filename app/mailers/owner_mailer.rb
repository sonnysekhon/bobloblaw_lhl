class OwnerMailer < ApplicationMailer

  def claim_business(user)
    @user = user
    email_with_name = %("#{@user.name}" <"almanac.sender@gmail.com">)
    mail(to: email_with_name, "Want's to claim a business")
  end

end