class Game < ApplicationRecord
  belongs_to :end_user
  has_many :game_comments, dependent: :destroy

  def self.search(search_word)
    Game.where(['category LIKE ?', "#{search_word}"])
  end
end