class Event < ApplicationRecord
  # validates :
  belongs_to :competition
  belongs_to :team
end