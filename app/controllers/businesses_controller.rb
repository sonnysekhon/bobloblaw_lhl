class BusinessesController < ApplicationController
  helper BusinessHelper

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id
    if @business.save
      redirect_to @business
    else
      render :new
    end
  end

  def index
    @businesses = Business.all

    if params[:search]
      @businesses = @businesses.check_query(params[:search])
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def format_id(string)
    string.match(/\d{1,}/)
  end

  def claim_business
    user_id = format_id("#{params[:user_id]}")
    name = params[:name]
    email = params[:email]
    business_name = params[:business_name]
    business_address = params[:business_address]
    business_phone = params[:business_phone]
    comments = params[:comments]

    OwnerMailer.claim_business_email(user_id, name, email, business_name, business_address, business_phone, comments).deliver
    flash[:notice] = "Business claim request has been sent."
    redirect_to '/'
  end


  def register_class
    businessID = format_id("#{params[:business_id]}")
    @business = Business.find(businessID[0].to_i)
    name = params[:name]
    phone_number = params[:phonenumber]
    email = params[:email]
    class_name = params[:class_name]
    class_date = params[:class_date]
    comments = params[:comments]
    
    ClassMailer.class_signup_email(name, phone_number, email, class_name, class_date, comments, @business).deliver
    flash[:notice] = "Class signup has been sent to the business."
    redirect_to(:back)
  end

  protected

  def business_params
    params.require(:business).permit(:category, :name, :phone, :email, :photo, :description, :website, :address, :city, :postal_code, :province, :country)
  end

end
