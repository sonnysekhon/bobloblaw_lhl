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
    @user = User.find_by(assign_business_params)
    if @user.user_type == "owner"
      @business.user_id = @user.id
      @business.save
      redirect_to admin_businesses_path
    else
      flash[:alert] = "Invalid"
      render :edit
    end

  end
  protected
  def assign_business_params
    params.require(:business).permit(:email)
  end


end
