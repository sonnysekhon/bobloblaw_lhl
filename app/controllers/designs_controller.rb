class DesignsController < ApplicationController
  skip_before_filter :show_navbar

  def new
    @design = Design.new
    # @business = Business.find(@design.business_id)
  end

  def find_design 
    @design = Design.find_by(business_id: @business.id)
  end

  def show
    @business = Business.find(params[:business_id])
    @design = Design.find_by(business_id: @business.id)
  end

end