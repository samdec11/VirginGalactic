class FlightsController < ApplicationController
  before_filter :require_admin, :except => [:show, :search, :results]
  def index
    @flights = Flight.order(:dep_time)
  end
  def new
    @flight = Flight.new
    @planes = Plane.all
  end
  def create
    Flight.create_plane(params)
    @flights = Flight.order(:dep_time)
    # @flight = Flight.create(params[:flight])
    # @flight.plane_id = params[:plane_select]
    # @flight.save
  end
  def show
    @flight = Flight.find(params[:id])
  end



  # Searching functionaility
  def search
    @flights = Flight.order(:dep_time)
  end

  def results
    dest = params[:to]
    origin = params[:from]
    @flights = Flight.where(dest:dest, origin:origin).sort_by(&:dep_time)
  end
end