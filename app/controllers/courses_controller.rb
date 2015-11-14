class CoursesController < ApplicationController

def index
    @courses = Course.sorted
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new(:name => "Defalut")
    @course_count = Course.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @course = Course.new(course_params)
    #Save the object
    if @course.save
      #If save succeeds, redirect to the index action
      flash[:notice] = "Course created successfully."
      redirect_to(:action => 'index')
    else
      #If save fails, redisplay the form so user can fix problems
      @course_count = Course.count + 1
      render('new')
    end
  end

  def edit
    @course = Course.find(params[:id])
    @course_count = Course.count
  end

  def update
    # Find and existing a new object using form parameters
    @course = Course.find(params[:id])
    # Update the object
    if @course.update_attributes(course_params)
      #If update succeeds, redirect to the index action
      flash[:notice] = "Course updated successfully."
      redirect_to(:action => 'show', :id => @course.id)
    else
      #If update fails, redisplay the form so user can fix problems
      @course_count = Course.count
      render('edit')
    end
  end
  
  def delete
    @course = Course.find(params[:id])
  end
  
  def destroy
    course = Course.find(params[:id]).destroy
    flash[:notice] = "Course '#{course.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
  
  private
    
    def course_params
      # same as using "params[:course]", except that it:
      # - raises an error if :course is not present
      # - allows listed attributes to be mass-assigned
      params.require(:course).permit(:name, :created_at)
    end
  
  
end
