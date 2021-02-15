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

end
