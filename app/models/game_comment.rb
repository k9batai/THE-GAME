class GameComment < ApplicationRecord
  
  belongs_to :end_user
  belongs_to :game

  validates :comment, presence: true, length: { in: 2..50 }
  
end
