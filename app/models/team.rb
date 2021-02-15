class Team < ApplicationRecord
    has_one :venue
    has_many :players
    has_many :coaches

    def self.team_names
        temp = Team.all
        team_names = []
        temp.each do |team|
            team_names.push(team.name)
        end
        return team_names
    end

    def self.division_array
        temp = Team.all
        division_array = []
        temp.each do |team|
            division_array.push(team.division)
        end
        return division_array.sort.uniq
    end

end
