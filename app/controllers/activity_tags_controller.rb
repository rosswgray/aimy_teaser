class ActivityTagsController < ApplicationController
  before_action :set_activity, only: [:new, :create]

  def new
    @activity_tag = ActivityTag.new
  end

  def create
    @tags = params[:activity_tag][:tag]
    puts "@tags??? ==>> #{@tags}"
    # => ["1", "4"]
    # raise

    @tags.each do |tag|
      @activity_tag = ActivityTag.create!(
        tag_id: tag.to_i,
        activity: @activity
        )
    end
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity_tag = ActivityTag.find(params[:id])
    @activity_tag.destroy
    redirect_to activity_path(@activity_tag.activity)
  end

  private

  def set_activity
    @activity = Activty.find(params[:activity_id])
  end

  def activity_tag_params
    params.require(:activity_tag).permit(:tag_id, :tag)
  end
end
