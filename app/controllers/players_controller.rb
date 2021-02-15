class PlayersController < ApplicationController
    before_action :find_player, only: [:show]

    def index
        @players = Player.all
    end

    def show
    end

    def position
        @players = Player.positions_array(params[:format])
    end

    private
    def find_player
        @player = Player.find(params[:id])
    end

end
