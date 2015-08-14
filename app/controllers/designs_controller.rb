class DesignsController < ApplicationController
  skip_before_filter :show_navbar, only: [:show]

  def new
    @design = Design.new
    # @business = Business.find(@design.business_id)
  end

  def create
    @business = Business.find(params[:business_id])
    @design = Design.create(design_params)
  end

  def show
    @business = Business.find(params[:business_id])
    @design = Design.find_by(business_id: @business.id)
  end

  def update
    @business = Business.find(params[:business_id])
    @design = @business.design
    if @design.update_attributes(design_params)
      render json: {}, status: 204
    else
      render json: @design.errors.to_json, status: 401
    end
  end


  protected
  def design_params
    params.require(:design).permit(:main_color, :secondary_color, :accent_color, :business_id)
  end

end