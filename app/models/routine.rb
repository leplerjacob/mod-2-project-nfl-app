class Routine < ApplicationRecord
  belongs_to :user
  has_many :workouts



  def get_date
    byebug
    Date.new(self.date.split("-")[0].to_i, self.date.split("-")[1].to_i, self.date.split("-")[2].to_i)
  end

end
