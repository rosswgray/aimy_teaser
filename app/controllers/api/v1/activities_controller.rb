class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    query = params[:query]
    if query.present?
      @activities = Activity.global_search(query)
      # @activities = Activity.joins(:organizer).where("title ILIKE :query, description ILIKE :query, organizers.name ILIKE :query", query: "%#{query}%")
    else
      @activities = Activity.all
      # p @activities
    end
    # KEEP LINE 12 commented out
    # render json: @activities #Just for testing
  end

  def show
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
  end

end
