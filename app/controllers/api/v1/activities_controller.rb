class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    query = params[:query]
    if query.present?
      @activities = Activity.global_search(query)
      # @activities = Activity.joins(:organizer).where("title ILIKE :query, description ILIKE :query, organizers.name ILIKE :query", query: "%#{query}%")
    else
      @activities = Activity.all
    end
    # rescue NoMethodError => e
    # KEEP LINE 12 commented out
    # render json: @activities #Just for testing
  end

  def show
    # if @activity.photo_1.attached? & @activity.photo_2.attached?
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
  end

  def favorite
    activity = Activity.find(param[:id])
    user = User.find(params[:user_id])
    user.favorite(activity)
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
