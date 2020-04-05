class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.create(allowed_params)
    redirect_to student_path(@student)
  end
  # def new

  # end
  
  # def create
  #   session[:form_params] = params.inspect
  #   redirect_to new_student_path
  # end

  private

    def allowed_params
      params.require(:student).permit(:first_name, :last_name)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end


