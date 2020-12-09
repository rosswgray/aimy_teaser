class Api::V1::InstructorsController < Api::V1::BaseController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
