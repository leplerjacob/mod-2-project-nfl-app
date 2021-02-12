# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

json_team_data = File.read("./db/team_data/Arizona-cardinals.json")
team_data_as_hash = JSON.parse(json_team_data)

2.times do
    byebug
end