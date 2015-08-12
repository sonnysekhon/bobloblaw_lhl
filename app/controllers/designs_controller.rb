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
    @design = Design.find(1)
    @business = Business.find(@design.business_id)
  end

end