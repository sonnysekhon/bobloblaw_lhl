class BusinessesController < ApplicationController

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
  end

  def show
    @business = Business.find(params[:id])
  end

  def claim_business
    # @business = Business.find(params[:id])
    # @user = User.find(session[:user_id])

    OwnerMailer.claim_business.deliver
    flash[:notice] = "Business claim request has been sent."
    redirect_to '/'
  end

  protected

  def business_params
    params.require(:business).permit(:category, :name, :phone, :email, :photo, :description, :website, :address, :city, :postal_code, :province, :country)
  end

end
