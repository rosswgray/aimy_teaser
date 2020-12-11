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
  end

  # def edit; end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     render json: {user: @user, status: :updated}
  #   else
  #     render_error  
  # end

  def favorites
    User.find(params[:user_id]).all_favorited
  end

  private

  def user_params
    params.require(:user).permit(:open_id, :profile_picture, :name, :phone_number, :address)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
