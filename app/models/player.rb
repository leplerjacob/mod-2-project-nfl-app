class Player < ApplicationRecord
    belongs_to :team
    has_many :coaches, through: :team

    def calc_age
        if self.birth_date != nil
            temp = self.birth_date
            date = temp.split("-")
            calculated = Time.now.year - date[0].to_i
            self.age = calculated
            return calculated
        end
    end

end
