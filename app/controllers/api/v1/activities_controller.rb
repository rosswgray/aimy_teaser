class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    query = params [:query]
    If query.present?
    Activity.global_search(query)
    # @activities = Activity.joins(:organizer).where("title ILIKE :query, description ILIKE :query, organizers.name ILIKE :query", query: "%#{query}%")
d.	else
    @activities = Activity.all
    render json: @activities #Just for testing
  end

  def show
    @activity = Activity.find(params[:id])
    @bookings = @activity.bookings
  end

end