class CoachesController < ApplicationController
    before_action :find_coach, only: [:show]

    def index
        @coaches = Coach.all
    end

    def show
    end

    private
    def find_coach
        @coach = Coach.find(params[:id])
    end
end
