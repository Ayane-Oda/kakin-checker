class Game < ApplicationRecord
  belongs_to :user
  has_many :kakins
end
