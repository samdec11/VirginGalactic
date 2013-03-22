class PlanesController < ApplicationController
  before_filter :require_admin
  def index
    @plane = Plane.all[1]
    @planes = Plane.all
  end
  def new
    @plane = Plane.new
  end
  def create
    @plane = Plane.create(params[:plane])
  end
end