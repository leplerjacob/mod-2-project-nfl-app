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

    def retrieve_data
        json_season_data = File.read("./db/season-data/schedule-all-teams.json")
        season_data_as_hash = JSON.parse(json_season_data)
        match_week_games = season_data_as_hash["weeks"][self.week-1]["games"]
        match_week_games.each do |game|
            if game["home"]["name"] == "Washington Football Team"
                home_name = "Football Team"
            else
                home_name_array = game["home"]["name"].split(" ")
                home_name = home_name_array[-1]
            end

            if game["away"]["name"] == "Washington Football Team"
                away_name = "Football Team"
            else
                away_name_array = game["away"]["name"].split(" ")
                away_name = away_name_array[-1]
            end
            
            if home_name == self.home_team.name && away_name == self.away_team.name
                return game
            end
        end
    end

end

# {"id"=>"15246a0c-b492-46aa-a980-a3bfce1eadc3", 
# "status"=>"closed", 
# "reference"=>"58185", 
# "number"=>18, 
# "scheduled"=>"2020-09-20T17:00:00+00:00", 
# "attendance"=>0, 
# "utc_offset"=>-6, 
# "entry_mode"=>"INGEST", 
# "weather"=>"Temp: 66 F, Humidity: 41%, Wind: SE 12 mph", 
# "sr_id"=>"sr:match:21980851", 
# "venue"=>{
#     "id"=>"d7866605-5ac6-4b3a-90e8-760cc5a26b75", 
#     "name"=>"Soldier Field", 
#     "city"=>"Chicago", 
#     "state"=>"IL", 
#     "country"=>"USA", 
#     "zip"=>"60605", 
#     "address"=>"1410 South Museum Campus Drive", 
#     "capacity"=>61500,
#      "surface"=>"turf", 
#      "roof_type"=>"outdoor", 
#      "sr_id"=>"sr:venue:2109", 
#      "location"=>{
#          "lat"=>"41.862498", 
#          "lng"=>"-87.616979"
#          }
#     }, 
# "home"=>{
#     "id"=>"7b112545-38e6-483c-a55c-96cf6ee49cb8", 
#     "name"=>"Chicago Bears", 
#     "alias"=>"CHI", 
#     "game_number"=>2, 
#     "sr_id"=>"sr:competitor:4391"
#     }, 
# "away"=>{
#     "id"=>"04aa1c9d-66da-489d-b16a-1dee3f2eec4d", 
#     "name"=>"New York Giants", 
#     "alias"=>"NYG", 
#     "game_number"=>2, 
#     "sr_id"=>"sr:competitor:4426"
#     }, 
# "broadcast"=>{
#     "network"=>"CBS"
#     }, 
# "scoring"=>{
#     "home_points"=>17, 
#     "away_points"=>13, 
#     "periods"=>[{

#         "period_type"=>"quarter", 
#         "id"=>"df08e57a-f564-4da7-b247-e6ef5238dacf", 
#         "number"=>1, 
#         "sequence"=>1, 
#         "home_points"=>10, 
#         "away_points"=>0}, 

#         {"period_type"=>"quarter", 
#         "id"=>"f0559ab7-f5c9-4ab5-af74-374dc6ff3929", 
#         "number"=>2, 
#         "sequence"=>2, 
#         "home_points"=>7, 
#         "away_points"=>0}, 
        
#         {"period_type"=>"quarter", 
#         "id"=>"e1bb79ff-66fb-49ad-823a-68516bac7b0a", 
#         "number"=>3, 
#         "sequence"=>3, 
#         "home_points"=>0, 
#         "away_points"=>3}, 
        
#         {"period_type"=>"quarter", 
#         "id"=>"15e1925d-3eba-432a-a95f-e89e1ee1609d", 
#         "number"=>4, 
#         "sequence"=>4, 
#         "home_points"=>0, 
#         "away_points"=>10}]
#         }
#     }