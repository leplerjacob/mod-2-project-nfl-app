class Venue < ApplicationRecord
    belongs_to :team
    has_many :matches
end
