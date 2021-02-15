class TeamsController < ApplicationController
    before_action :find_team, only: [:show]

    def index
        @divisions = Team.division_array
        @teams = Team.all
    end

    def show
    end

    private
    def find_team
        @team = Team.find(params[:id])
    end

end
