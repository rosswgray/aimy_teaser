class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    # render json: @bookings #Just for testing
  end

  def new
    @booking = Booking.new
  end
  
  # from API controller, won't work for now

  # def create
  #   set_parent
  #   set_activity
  #   @booking = Booking.new(booking_params)
  #   @booking.parent = @parent
  #   @booking.activity = @activity
  #   if @booking.save
  #     render json: { booking: @booking, status: :success }
  #   else
  #     render_error
  #   end
  # end

  private

  def set_parent
    @parent = User.find(params[:user_id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :activity_id, :confirmed)
  end
end
