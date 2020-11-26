class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = Booking.all
    # render json: @bookings #Just for testing
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: { booking: @booking, status: :success }
    else
      render_error
    end
  end

  private

  def set_parent
    @parent = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :activity_id, :confirmed)
  end

  def render_error
    render json: { error: @booking.errors.full_messages }
  end
end
