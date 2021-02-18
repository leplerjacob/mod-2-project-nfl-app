class Match < ApplicationRecord
    has_many :team_matches
    has_many :teams, through: :team_matches
    # has_and_belongs_to_many :teams

    def self.weeks
        matches = TeamMatch.all
        ans = 0
        matches.each do |match|
            ans = match["week"]
        end
        return ans
    end

    def home
        return Team.find_by(id: self.home_team_id)
    end

    def away
        return Team.find_by(id: self.away_team_id)
    end

    def venue
        return Venue.find_by(id: self.venue_id)
    end

    def winner
        if self.home_score > self.away_score
            return self.home
        else
            return self.away
        end
    end 

end