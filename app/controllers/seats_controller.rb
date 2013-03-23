class SeatsController < ApplicationController
def reserve
  s = Seat.find(params[:id])
  s.user_id = @auth.id
  s.save
  @flight = s.flight
end

end
