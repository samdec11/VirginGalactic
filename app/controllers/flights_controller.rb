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
    f = Flight.create(params[:flight])
    i = params[:plane_select].to_i
    f.create_seats(i)
    @flights = Flight.order(:dep_time)
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