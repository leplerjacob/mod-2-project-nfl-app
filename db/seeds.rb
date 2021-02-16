# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Team.destroy_all
Player.destroy_all
Coach.destroy_all
Venue.destroy_all

def finder_create(team_hash)

    
    team = Team.create(
        name: team_hash["name"],
        state: team_hash["market"],
        wins: 0,
        losses: 0,
        division: team_hash["division"]["name"]
        )

    venue = Venue.create(
        name: team_hash["venue"]["name"],
        city: team_hash["venue"]["city"],
        state: team_hash["venue"]["state"],
        capacity: team_hash["venue"]["capacity"],
        team_id: team.id
    )

    team_hash["players"].each{|player|
        Player.create(
            first_name: player["first_name"],
            last_name: player["last_name"],
            birth_date: player["birth_date"],
            age: 0,
            jersey: player["jersey"],
            position: player["position"],
            home_town: player["birth_place"],
            college: player["college"],
            weight: player["weight"],
            height: player["height"],
            bio: Faker::Lorem.paragraph,
            team_id: team.id
        )
    }

    team_hash["coaches"].each{|coach|
        Coach.create(
            first_name: coach["first_name"],
            last_name: coach["last_name"],
            position: coach["position"],
            bio: Faker::Lorem.paragraph,
            team_id: team.id
        )
    }
end

# Create array of file names to interpolate into File.read command below
# example json_team_data = File.read("./db/team_data/#{<filename>}.json")

files = ["Arizona-cardinals", "Atlanta-falcons", "Baltimore-ravens",
        "Buffalo-bills", "Carolina-panthers", "Chicago-bears", "Cincinnati-bengals",
        "Cleveland-browns", "Dallas-cowboys", "Denver-broncos", "Detroit-lions", "Green-bay-packers",
        "Houston-texans", "Indianapolis-colts", "Jacksonville-jaguars", "Kansas-city-chiefs",
        "Las-vegas-raiders", "Los-angeles-chargers", "Los-angeles-rams", "Miami-dolphins",
        "Minnesota-vikings", "New-england-patriots", "New-orleans-saints", "New-york-jets", "New-york-giants", 
        "Philadelphia-eagles", "Pittsburgh-steelers", "San-francisco-49ers", "Seattle-seahawks",
        "Tampa-bay-buccaneers", "Tennessee-titans", "Washington-football-team"]

x = 0
files.length.times do
    json_team_data = File.read("./db/team_data/#{files[x]}.json")
    team_data_as_hash = JSON.parse(json_team_data)
    finder_create(team_data_as_hash)
    x += 1
end

