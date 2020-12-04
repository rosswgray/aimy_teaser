class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = Booking.all
    # render json: @bookings #Just for testing
  end

  def new
    @booking = Booking.new
  end

  def create
    set_parent
    set_activity
    @booking = Booking.new(booking_params)
    @booking.parent = @parent
    @booking.activity = @activity
    if @booking.save
      render json: { booking: @booking, status: :success }
    else
      render_error
    end
  end

  def update
    set_parent
    set_activity
    @booking = Booking.find(booking_params)
    if @booking.update(booking_params)
      render json: { booking: @booking, status: :updated }
    else
      render_error
    end
  end

  private

  def set_parent
    @parent = User.find(params[:user_id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :session_id, :confirmed, :cancelled)
  end

  def render_error
    render json: { error: @booking.errors.full_messages }
  end
end
