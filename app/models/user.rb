class User < ApplicationRecord
    has_secure_password
    has_one :player, dependent: :nullify
    has_many :routines
    has_many :workouts, through: :routines
    validates :username, presence: true, uniqueness: true
    before_create :downcase_username

    def downcase_username
        self.username.downcase!   
    end

    def name_id=(id)
        player = Player.find(id)
        if player.user.nil?
            self.player = Player.find(id)
        end
    end

    def name
        Player.find(self.name_id).name_to_s if self.name_id
    end

end
