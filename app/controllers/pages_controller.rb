class PagesController < ApplicationController
  
  def list_courses
    @courses = Course.sorted
  end

  def show_course
    @course = Course.find(params[:id])
  end

  def show_user
  end

  def home
  end

  def about
  end

  def contact
  end

  def terms
  end

  def privacy
  end
end
