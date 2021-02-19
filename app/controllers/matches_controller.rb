class MatchesController < ApplicationController
    before_action :find_match, only: [:show]

    def index
        @matches = Match.all
    end

    def show
        @data = @match.retrieve_data
        @quarters = @data["scoring"]["periods"]
    end

    private
    def find_match
        @match = Match.find(params[:id])
    end

end
