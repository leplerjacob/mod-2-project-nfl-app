class PlayersController < ApplicationController
    before_action :find_player, only: [:show]

    def index
        @team_names = Team.team_names
        @players = Player.all
    end

    def show
    end

    private
    def find_player
        @player = Player.find(params[:id])
    end

end
