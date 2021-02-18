class Player < ApplicationRecord
    belongs_to :team
    belongs_to :user, optional: true
    has_many :coaches, through: :team


    # Returns "firstname lastname"
    def name_to_s
        self.first_name + " " + self.last_name
    end

    # Returns "lastname firstname"
    def last_name_first
        self.last_name + ", " + self.first_name
    end

    def self.return_players_without_accounts
        Player.where(user_id: nil)
    end

    def calc_age
        if self.birth_date != nil
            temp = self.birth_date
            date = temp.split("-")
            calculated = Time.now.year - date[0].to_i
            self.age = calculated
            return calculated
        end
    end

    def self.positions_array(p)
        p_array = []
        Player.all.each do |player|
            if player.position == p
                p_array.push(player)
            end
        end
        return p_array
    end

    def retrieve_data

        team_data = File.read("./db/season-data/#{self.team.name.downcase}-s.json")
        team_data_as_hash = JSON.parse(team_data)
        player_hash = Hash.new
        team_data_as_hash["players"].each do |player| 
            if player["name"] == self.name_to_s
                player_hash = player
            end
        end

        stats = ["touchdowns", "rushing", "receiving", "punts", 
        "punt_returns", "penalties", "passing", "kickoffs", "kick_returns", "interceptions", 
        "int_returns", "fumbles", "first_downs", "field_goals", "extra_points", "efficiency", "defense"]

        player_stats = Hash.new

        player_hash.each do |stat_key , stat_value|
            if stats.include?(stat_key)
                player_stats[stat_key] = stat_value
            end
        end

        return player_stats

    end

end