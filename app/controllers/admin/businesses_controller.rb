class Admin::BusinessesController < ApplicationController
  before_action :require_admin

  def require_admin
    if current_user.user_type != "superuser"
      flash[:error] = "Unauthorized Access"
      redirect_to '/'

    end
  end

  def new
    @business = Business.new
  end
  def index
    @businesses = Business.order("name").page(params[:page])
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    
    @user = User.find(assign_business_params[:user_id])
    #binding.pry
    if @user
      @user.user_type = "owner"
      binding.pry
      @business.user_id = assign_business_params[:user_id]
      @business.save
      redirect_to admin_businesses_path
    else
      flash[:alert] = "Invalid"
      render :edit
    end

  end
  protected
  def assign_business_params
    params.require(:business).permit(:user_id)
  end


end
