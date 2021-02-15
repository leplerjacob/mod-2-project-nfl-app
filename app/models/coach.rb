class Coach < ApplicationRecord
    belongs_to :team
    has_many :players, through: :team

    def self.positions_array(p)
        p_array = []
        Coach.all.each do |coach|
            if coach.position == p
                p_array.push(coach)
            end
        end
        return p_array
    end

end
