class PlantTagsController < ApplicationController
    before_action :set_activity, only: [:new, :create]
  
    def new
      @activity_tag = ActivityTag.new
    end
  
    def create
      
      @tags = params[:plant_tag][:tag]
      puts "@tags??? ==>> #{@tags}"
      # => ["1", "4"]
      # raise
  
      @tags.each do |tag|
        @plant_tag = PlantTag.create!(
          tag_id: tag.to_i,
          plant: @plant
           )
      end
  
      # @plant_tag = PlantTag.new(plant_tag_params)
      # @plant_tag.plant = @plant
      # @plant_tag.save!
      redirect_to garden_path(@plant.garden)
    end
  
    def destroy
      @plant_tag = PlantTag.find(params[:id])
      @plant_tag.destroy
      redirect_to garden_path(@plant_tag.plant.garden)
    end
  
    private
  
    def set_plant
      @plant = Plant.find(params[:plant_id])
    end
  
    def plant_tag_params
      params.require(:plant_tag).permit(:tag_id, :tag)
    end
  end