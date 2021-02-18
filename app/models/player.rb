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

# {
# "fumbles"=>
#     {"fumbles"=>0, 
#     "lost_fumbles"=>0,
#      "own_rec"=>0, 
#      "own_rec_yards"=>0, 
#      "opp_rec"=>1, 
#      "opp_rec_yards"=>0, 
#      "out_of_bounds"=>0, 
#     "forced_fumbles"=>2, 
#     "own_rec_tds"=>0, 
#     "opp_rec_tds"=>0, 
#     "ez_rec_tds"=>0}, 
# "defense"=>
#     {"tackles"=>10, 
#     "assists"=>1, 
#     "combined"=>11, 
#     "sacks"=>2.0, 
#     "sack_yards"=>13.0, 
#     "interceptions"=>0,
#     "passes_defended"=>1, 
#     "forced_fumbles"=>2,
#     "fumble_recoveries"=>1,
#     "qb_hits"=>3,
#     "tloss"=>1.0,
#     "tloss_yards"=>10.0,
#     "safeties"=>0,
#     "sp_tackles"=>0,
#     "sp_assists"=>0,
#     "sp_forced_fumbles"=>0, 
#     "sp_fumble_recoveries"=>0, 
#     "sp_blocks"=>0, 
#     "misc_tackles"=>0, 
#     "misc_assists"=>0, 
#     "misc_forced_fumbles"=>0, 
#     "misc_fumble_recoveries"=>0, 
#     "def_targets"=>1, 
#     "def_comps"=>1, 
#     "blitzes"=>0, 
#     "hurries"=>2, 
#     "knockdowns"=>2,
#     "missed_tackles"=>3, 
#     "batted_passes"=>1}
# } 