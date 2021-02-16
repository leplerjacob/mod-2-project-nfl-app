class PlayersController < ApplicationController
    before_action :logged_in_user
    before_action :find_player, only: [:show]

    def index
        @players = Player.all.sort{|a,b| a.first_name <=> b.first_name}
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
