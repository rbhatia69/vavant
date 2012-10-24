class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
      @courses = Course.all
  end

  def authored
    @courses = Course.courses_authored_by_user(current_user.id)

    @registered_courses = Registration.user_registrations(current_user.id)
  end

  def register
    @register = Registration.new(:user_id => current_user.id, :course_id => params[:course_id])
   if @register.save
        redirect_to(course_path(:id => params[:course_id]), :notice => 'You have successfully registered for the course.')
    end
  end

  def show
    @course = Course.find(params[:id])

    @is_user_registered = false
    if (current_user)
      @is_user_registered = Registration.is_user_registered_for_course(@course.id, current_user.id)
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.user_id = current_user.id

    if @course.save
        redirect_to(courses_authored_path, :notice => 'Course was successfully created.')
    else
        render :action => "new"
    end

  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
        redirect_to(courses_authored_path, :notice => 'Course was successfully updated.')
    else
        render :action => "new"
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to(courses_authored_path, :notice => 'Course was successfully deleted.')
  end
end
