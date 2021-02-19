class VenuesController < ApplicationController
    before_action :logged_in_user
    before_action :find_venue, only: [:show]

    def index
        @venues = Venue.all
    end

    def show
    end

    private
    def find_venue
        @venue = Venue.find(params[:id])
    end
    
end
