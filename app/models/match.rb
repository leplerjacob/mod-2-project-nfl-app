class Match < ApplicationRecord
    belongs_to :venue
    belongs_to :home_team, class_name: 'Team'
    belongs_to :away_team, class_name: 'Team'

    def self.weeks
        matches = TeamMatch.all
        ans = 0
        matches.each do |match|
            ans = match["week"]
        end
        return ans
    end

    def winner
        if self.home_score > self.away_score
            return self.home_team
        else
            return self.away_team
        end
    end 

end