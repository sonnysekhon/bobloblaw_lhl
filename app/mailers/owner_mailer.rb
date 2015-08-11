class OwnerMailer < ApplicationMailer

  def claim_business_email(user_id, name, email, business_name, business_address, business_phone, comments)
    # binding.pry
    @id = user_id
    @name = name
    @email = email
    @business_name = business_name
    @business_address = business_address
    @business_phone = business_phone
    @comments = comments 
    
    mail(to: 'almanac.sender@gmail.com', subject: "Want's to claim a business")
  end

end