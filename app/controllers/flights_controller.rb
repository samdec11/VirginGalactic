class FlightsController < ApplicationController
  before_filter :require_admin
  def index
    @flights = Flight.all
  end
  def new
    @flight = Flight.new
    @planes = Plane.all
  end
  def create
    flight.create_plane(params)
    # @flight = Flight.create(params[:flight])
    # @flight.plane_id = params[:plane_select]
    # @flight.save
  end
  def show
    @flight = Flight.find(params[:id])
  end
end