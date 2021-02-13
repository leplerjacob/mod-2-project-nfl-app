class Player < ApplicationRecord
    belongs_to :team
    belongs_to :user, optional: true
    has_many :coaches, through: :team

    # def player_exists(name)
    #     [first_name, last_name] = name.split(" ")
    #     player = Player.find_by(first_name: first_name, last_name: last_name)
    #     player.nil?
    # end

    def name_to_s
        self.first_name + " " + self.last_name
    end
end
