class TeamsController < ApplicationController
    before_action :find_team, only: [:show]

    def index
        @teams = Team.all
    end

    def show
    end

    def stats
        @team = Team.find(params[:team_id])
        @stats = @team.retrieve_data
    end

    private
    def find_team
        @team = Team.find(params[:id])
    end

end
