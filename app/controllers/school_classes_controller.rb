class SchoolClassesController < ApplicationController

  def new
  end

  def show
    @school_class = SchoolClass.find(params[:id])
  end

  def create
    @school_class = SchoolClass.new(post_params(:title, :room_number))
    @school_class.save
    redirect_to student_path(@school_class)
  end

  def update
    @school_class = SchoolClass.find(params[:id])
    @school_class.update(post_params(:title, :room_number))
    redirect_to student_path(@school_class)
  end

  private

  def post_params(*args)
    params.require(:school_class).permit(*args)
  end
end
