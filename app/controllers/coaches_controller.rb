class CoachesController < ApplicationController
    before_action :find_coach, only: [:show]

    def index
        @coaches = Coach.all.sort{|a,b| a.first_name <=> b.first_name}
    end

    def show
    end

    def position
        @coaches = Coach.positions_array(params[:format])
    end

    private
    def find_coach
        @coach = Coach.find(params[:id])
    end
end
