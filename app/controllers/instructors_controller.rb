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
  end

  def update
  end
end
