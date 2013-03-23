class PlanesController < ApplicationController
  before_filter :require_admin
  def index
    @planes = Plane.all
    if Plane.first.present?
      @plane = Plane.all.first
    end
  end
  def new
    @plane = Plane.new
  end
  def create
     p1 = Plane.new(params[:plane])
     if p1.save
        @plane = p1
     end
     @planes = Plane.all
  end
  def show
    @plane = Plane.find(params[:id])
    @planes = Plane.all
  end
end