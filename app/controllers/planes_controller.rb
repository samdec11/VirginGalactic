class PlanesController < ApplicationController
  before_filter :require_admin
  def index
  end
  def new
    @plane = Plane.new
  end
  def create
    @plane = Plane.create(params[:plane])
  end
end