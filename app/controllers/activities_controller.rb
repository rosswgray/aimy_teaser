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

end
