class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    query = params [:query]
    if query.present?
      @activities = Activity.global_search(query)
      # @activities = Activity.joins(:organizer).where("title ILIKE :query, description ILIKE :query, organizers.name ILIKE :query", query: "%#{query}%")
    else
      @activities = Activity.all
    end
    render json: @activities #Just for testing
  end

  def show
    @activity = Activity.find(params[:id])
    @bookings = @activity.bookings
  end
end
