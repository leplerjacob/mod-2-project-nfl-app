class RoutinesController < ApplicationController
  before_action :logged_in_user

  def index
    @routines = Routine.where(user_id: session[:user_id])
  end

  def new
    # @routine = Routine.new
  end

  def create
    @routine = Routine.create(routine_params)
    if @routine.valid?
      params[:routine][:number].to_i.times do |w|
        @routine.workouts << Workout.create
      end
      redirect_to bulk_new_path
    else
    end
  end

  def show
  end

  private
    def routine_params
      params.require(:routine).permit(:title, :date, :location, :user_id)
    end
end
