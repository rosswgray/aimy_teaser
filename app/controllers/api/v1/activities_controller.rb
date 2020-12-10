class Api::V1::ActivitiesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    query = params[:query]
    if query.present?
      @activities = Activity.global_search(query)
      # @activities = Activity.joins(:organizer).where("title ILIKE :query, description ILIKE :query, organizers.name ILIKE :query", query: "%#{query}%")
    else
      @activities = Activity.all.order("created_at DESC")
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
    @user = User.find(params[:user_id])
  end

  def favorite
    activity = Activity.find(params[:id])
    user = User.find(params[:user_id])
    user.favorited?(activity) ? user.unfavorite(activity) : user.favorite(activity)
    render json: {favorited: user.favorited?(activity)}
  end

  def unfavorite
    activity = Activity.find(param[:id])
    user = User.find(params[:user_id])
    user.unfavorite(activity)
  end

  def favorited
    user = User.find(params[:user_id])
    user.all_favorited
  end
end
