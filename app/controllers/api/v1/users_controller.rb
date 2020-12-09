class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [ :create, :update ]
  
  def index
    @users = User.all
    # render json: @users # Just for testing
  end

  def show
    @user = User.find(params[:id])

    # if @user.role == 'organizer'
    @bookings_as_organizer = @user.bookings_as_organizer
    # elsif @user.role == 'parent'
    @bookings = @user.bookings
    # end
    p "testing"
    p @user.all_favorites[0]
  end

  def favorites
    User.find(params[:user_id]).all_favorited
  end
end
