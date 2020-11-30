class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users # Just for testing
  end

  def show
    @user = User.find(params[:id])

    # if @user.role == 'organizer'
      @bookings_as_organizer = @user.bookings_as_organizer
    # elsif @user.role == 'parent'
      @bookings = @user.bookings
    # end
  end
end
