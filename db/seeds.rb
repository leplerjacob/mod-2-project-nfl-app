# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

# Create array of file names to interpolate into File.read command below
# example json_team_data = File.read("./db/team_data/#{<filename>}.json")
["Arizona-cardinals"]

json_team_data = File.read("./db/team_data/Arizona-cardinals.json")
team_data_as_hash = JSON.parse(json_team_data)

10.times do
    team_data_as_hash["players"].each{|player|
        Player.create(
            first_name: player["name"].split(" ")[0],
            last_name: player["name"].split(" ")[1],
            birth_date: player[""],
            age: player[""],
            jersey: player[""],
            position: player[""],
            home_town: player[""],
            college: player[""],
            weight: player[""],
            height: player[""],
            bio: Faker::Lorem.paragraph
        )
        byebug
}
end

Player.destroy_all
# create_table "players", force: :cascade do |t|
#     t.string "username"
#     t.string "password"
#     t.string "first_name"
#     t.string "last_name"
#     t.string "birth_date"
#     t.integer "age"
#     t.string "jersey"
#     t.string "position"
#     t.string "home_town"
#     t.string "college"
#     t.float "weight"
#     t.float "height"
#     t.text "bio"
#     t.integer "team_id"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["team_id"], name: "index_players_on_team_id"
#   end