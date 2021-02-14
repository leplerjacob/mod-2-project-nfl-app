class PlayersController < ApplicationController
    before_action :find_player, only: [:show]

    def index
        temp = Team.all
        @team_names = []
        temp.length.times do
            @team_names.push(temp.name)
        end
        @players = Player.all
    end

    def show
    end

    private
    def find_player
        @player = Player.find(params[:id])
    end

end
