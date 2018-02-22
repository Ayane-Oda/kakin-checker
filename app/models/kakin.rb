class Kakin < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :user_id, :game_id, presence: true
  validates :date, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :comment, allow_blank: true, length: { maximum: 255 }
end
