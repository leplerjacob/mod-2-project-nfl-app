class WorkoutsController < ApplicationController
  before_action :logged_in_user
  
  def new
  end

  def create

  end

  def bulk_new
    @routine = Routine.order(created_at: :desc).first
    @workouts = @routine.workouts
  end

  def update_routine_workouts
    byebug
  end

  def show
  end

end
