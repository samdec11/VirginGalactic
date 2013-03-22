class PlanesController < ApplicationController
  def index
  end
  def new
    @plane = Plane.new
  end
  def create
    @plane = Plane.create(params[:plane])
  end
end