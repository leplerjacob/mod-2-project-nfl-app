class Team < ApplicationRecord
    has_one :venue
    has_many :players
    has_many :coaches
end
