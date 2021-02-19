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
User.destroy_all
Routine.destroy_all
Workout.destroy_all
Match.destroy_all
# Team_Match.destroy_all

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

User.create(name_id: 2345, username: "tbrady", password: "tb", password_confirmation: "tb", email: "tb@gmail.com", phone_number: "1112223332")

Routine.create(user_id: 1, title: 'Legs, back, abs', date: "2021-02-14", location: "")
Routine.create(user_id: 1, title: 'Chest, arms, back, shoulders', date: "2021-02-15", location: "")
Routine.create(user_id: 1, title: 'Legs, back, shoulders, abs', date: "2021-02-16", location: "")

# routine 1
Workout.create(name: "dumbell box squat", weight: 60, reps: 3, sets: 5, routine_id: Routine.first.id)
Workout.create(name: "dumbell bulgarian squat", weight: 60, reps: 8, sets: 3, routine_id: Routine.first.id)
Workout.create(name: "bench weighted back extension", weight: 45, reps: 12, sets: 4, routine_id: Routine.first.id)
Workout.create(name: "dumbell side bend", weight: 30, reps: 12, sets: 4, routine_id: Routine.first.id)
Workout.create(name: "sprinter situp", weight: 0, reps: 3, sets: 5, routine_id: Routine.first.id)

# routine 2
Workout.create(name: "barbell bench press", weight: 60, reps: 3, sets: 5, routine_id: Routine.second.id)
Workout.create(name: "dumbell neutral-grip floow press", weight: 60, reps: 8, sets: 3, routine_id: Routine.second.id)
Workout.create(name: "dumbell row", weight: 40, reps: 20, sets: 2, routine_id: Routine.second.id)
Workout.create(name: "seated dumbbell lateral raise", weight: 40, reps: 10, sets: 3, routine_id: Routine.second.id)
Workout.create(name: "seated dumbbell clean", weight: 40, reps: 10, sets: 3, routine_id: Routine.second.id)
Workout.create(name: "dumbbell zottman curl", weight: 40, reps: 8, sets: 3, routine_id: Routine.second.id)

# routine 3
Workout.create(name: "high box jump", weight: 0, reps: 2, sets: 8, routine_id: Routine.third.id)
Workout.create(name: "dumbbell reverse lunge", weight: 40, reps: 10, sets: 3, routine_id: Routine.third.id)
Workout.create(name: "dumbbell one-arm swing", weight: 25, reps: 15, sets: 3, routine_id: Routine.third.id)
Workout.create(name: "weighted situp", weight: 25, reps: 15, sets: 3, routine_id: Routine.third.id)

json_season_data = File.read("./db/season-data/schedule-all-teams.json")
season_data_as_hash = JSON.parse(json_season_data)
season_data_weeks = season_data_as_hash["weeks"]


season_data_weeks.each do |week_data|
    games = week_data["games"]
    week = week_data["sequence"]

    games.each do |game|
        if game["status"] == "closed"
            venue = game["venue"]["name"]
            venue_id = Venue.find_by(name: venue).id

            home_team = game["home"]["name"]
            if home_team == "Washington Football Team"
                home_team_name = "Football Team"
            else
                home_team_array = home_team.split(" ")
                home_team_name = home_team_array[-1]
            end
            home_t = Team.find_by(name: home_team_name)
            home_team_id = home_t.id

            away_team = game["away"]["name"]
            if away_team == "Washington Football Team" 
                away_team_name = "Football Team"
            else
                away_team_array = away_team.split(" ")
                away_team_name = away_team_array[-1]
            end
            away_t = Team.find_by(name: away_team_name)
            away_team_id = away_t.id

            home_score = game["scoring"]["home_points"]
            away_score = game["scoring"]["away_points"]

            match = Match.create(
                date: "",
                week: week,
                venue_id: venue_id,
                home_team_id: home_team_id,
                away_team_id: away_team_id,
                home_score: home_score,
                away_score: away_score
            )

            TeamMatch.create(
                date: "",
                week: week,
                venue_id: venue_id,
                match_id: match.id,
                home_team_id: home_team_id,
                away_team_id: away_team_id,
                home_score: home_score,
                away_score: away_score
            )
        end
    end
end
