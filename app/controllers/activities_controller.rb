class ActivitiesController < ApplicationController
  def index
    ## check if activity.main_photo.blank?
    ### @activty_url = ....
    @activities = Activity.includes(:sessions)

    query = params[:query]
    if query.present?
      @activities = Activity.global_search(query)
    else
      @activities = Activity.all.order("created_at DESC")
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @user = current_user
    @activity = Activity.new(activity_params)
    @activity.organizer = @user
    @activity.save
    # raise
    redirect_to activities_path
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
    @sessions = @activity.sessions.order("start_time ASC")
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
    params.require(:activity).permit(:title, :description, :main_photo, :photo_1, :photo_2, :photo_3, :price, :rating, :address, :latitude, :longitude, :tag_list)
  end
end
