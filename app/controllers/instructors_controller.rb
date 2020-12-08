class InstructorsController < ApplicationController
  def show
  end

  def index
    @instructors = Instructor.all
  end

  def new
  end

  def create
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update(instructor_params)
    redirect_to instructors_path
  end

  private

  def instructor_params
    params.require(:instructor).permit(:user_id, :name, :years_experience, :date_started, :certifications, :verified, :blurb)
  end
end
