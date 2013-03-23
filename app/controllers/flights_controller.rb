class FlightsController < ApplicationController
  def index
  end
  def new
  end
  def create
  end



  # Searching functionaility
  def search
    @flights = Flight.all.sort_by(&:name)
  end
  def results
    dest = params[:to]
    origin = params[:from]
    @flights = Flight.where(dest:dest, origin:origin).sort_by(&:name)
  end
end