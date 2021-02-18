class WorkoutsController < ApplicationController
  before_action :logged_in_user
  
  def new
  end

  def create

  end

  def bulk_new
    @routine = Routine.order(created_at: :desc).first
    @workouts = @routine.workouts
    byebug
  end

  def update_routine_workouts
    User.find(session[:user_id]).routines.last.workouts.each_with_index {|workout, i|
      params
      workout.name = params["workout #{i+1}"]["name"]
      workout.weight = params["workout #{i+1}"]["weight"]
      workout.reps = params["workout #{i+1}"]["reps"]
      workout.sets = params["workout #{i+1}"]["sets"]
      workout.distance = params["workout #{i+1}"]["distance"]
      workout.duration = params["workout #{i+1}"]["duration"]
      workout.save
    }
    redirect_to routines_path
  end

  def show
  end

end
