class PlanesController < ApplicationController
  def index

    @planes = Plane.all
  end
  def new
    @plane = Plane.new
  end
  def create
    @plane = Plane.create(params[:plane])
  end
  def show
    @plane = Plane.find(params[:id])
  end
end