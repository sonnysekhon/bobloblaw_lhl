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
    if current_user.user_type == "owner"
      @businesses = Business.where("user_id = ?", current_user.id)
    else  
      @businesses = Business.all
    end

    if params[:search]
      @businesses = @businesses.check_query(params[:search])
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def format_id(string)
    string.match(/\d/)
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

  protected

  def business_params
    params.require(:business).permit(:category, :name, :phone, :email, :photo, :description, :website, :address, :city, :postal_code, :province, :country)
  end

end
