class User < ApplicationRecord
    has_secure_password
    has_one :player
    validate :check_player_exists

    def player_name=(name)
        first_name, last_name = name.split(" ")
        player = Player.find_by(first_name: first_name, last_name: last_name)
        self.name_id = player.id
    end

    def name
        Player.find(self.name_id).name_to_s if self.name_id
    end

    private
        def check_player_exists
            # byebug
            # player_exists()
        end
end
