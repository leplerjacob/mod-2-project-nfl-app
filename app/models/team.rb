class Team < ApplicationRecord
    has_one :venue
    has_many :players
    has_many :coaches
    # has_many :matches
    has_many :team_matches
    has_many :matches, through: :team_matches

    def self.team_names
        temp = Team.all
        team_names = []
        temp.each do |team|
            team_names.push(team.name)
        end
        return team_names.sort
    end

    def self.division_array
        temp = Team.all
        division_array = []
        temp.each do |team|
            division_array.push(team.division)
        end
        return division_array.sort.uniq
    end

    def retrieve_data

        team_data = File.read("./db/season-data/#{self.name.downcase}-s.json")
        team_data_as_hash = JSON.parse(team_data)

        stats = ["touchdowns", "rushing", "receiving", "punts", 
        "punt_returns", "penalties", "passing", "kickoffs", "kick_returns", "interceptions", 
        "int_returns", "fumbles", "first_downs", "field_goals", "extra_points", "efficiency", "defense"]

        team_stats = Hash.new

        team_data_as_hash["record"].each do |stat_key , stat_value|
            if stats.include?(stat_key)
                team_stats[stat_key] = stat_value
            end
        end

        return team_stats

    end

    # def calc_wins
    #     wins = 0
    #     self.matches.each do |match|
    #         if match.winner == self
    #             wins += 1
    #         end
    #     end
    #     return wins
    # end

    # def calc_losses
    #     losses = 0
    #     self.matches.each do |match|
    #         if match.winner != self
    #             losses += 1
    #         end
    #     end
    #     return losses
    # end

end
