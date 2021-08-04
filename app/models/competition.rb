class Competition < ApplicationRecord
  # validates :
  has_many :events
  has_many :teams, through: :events

  def average_age_players
    teams.joins(:players)
          .select('players.*')
          .average(:age)
  end
end