class BusinessesController < ApplicationController

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

end