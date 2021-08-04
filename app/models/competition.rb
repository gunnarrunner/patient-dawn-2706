class Competition < ApplicationRecord
  # validates :
  has_many :events
  has_many :teams, through: :events
end