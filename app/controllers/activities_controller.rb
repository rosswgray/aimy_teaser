class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    # query = params[:query]
    # if query.present?
    #   @activities = Activity.global_search(query)
    # else
    #   @activities = Activity.all
    #   p @activities
    # end
  end

  def edit; end

  def update
    @activty.update(activity_params)
    render :new
  end

  def show
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :main_photo, :photo_1, :photo_2, :photo_3, :price, :rating, :latitude, :longitude)
  end
end
