class OwnerMailer < ApplicationMailer

  def claim_business
    # @user = user
    # @business = business
    # email_with_name = %("#{@user.name}" <"almanac.sender@gmail.com">)
    mail(to: 'almanac.sender@gmail.com', subject: "Want's to claim a business with id")
  end

end