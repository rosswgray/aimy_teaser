class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    query = params[:query]
    if query.present?
      @activities = Activity.global_search(query)

    else
      @activities = Activity.all
      # p @activities
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def show
    @activity = Activity.find(params[:id])
    @sessions = @activity.sessions
  end

  def remove_tag
    @activity.tag_list.remove(params[:tag])
    @activity.save!

    # redirect_to activities_path(@activity)
  end

  def tagged
    if params[:tag].present?
      @activities = Activity.tagged_with(params[:tag])
    else
      @activities = Activity.all
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :main_photo, :photo_1, :photo_2, :photo_3, :price, :rating, :latitude, :longitude)
  end
end
