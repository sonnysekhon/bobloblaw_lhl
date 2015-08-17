class ClassMailer < ApplicationMailer

  def class_signup_email(name, phone_number, email, class_name, class_date, comments, business)
    @name = name
    @phonenumber = phone_number
    @email = email
    @class_name = class_name
    @class_date = class_date
    @comments = comments
    @business = business

    mail(to: @business.email, subject: "Want's to sign up for a class!")
  end

end