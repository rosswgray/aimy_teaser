class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [ :create, :update ]

  def index
    set_parent
    @bookings = @parent.bookings.joins(:session).order("start_time ASC")
  end

  def new
    @booking = Booking.new
  end

  # before creating a new booking, checks to see if the user
  # has already booked that session id
  def create
    set_parent
    set_session
    if @session.bookings.where(user_id: @parent.id) != []
      render_booked
    else
      @booking = Booking.new(booking_params)
      @booking.parent = @parent
      @booking.session = @session
      if @booking.save
        render json: { booking: @booking, status: :success }
      else
        render_error
      end
    end
  end

  def update
    set_parent
    set_session
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

  def set_session
    @session = Session.find(params[:session_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :session_id, :confirmed, :cancelled)
  end

  def render_error
    render json: { error: @booking.errors.full_messages }
  end

  def render_booked
    render json: { error: :already_booked }
  end

  # def render_full
  #   render json: { error: :session_full }
  # end
end
