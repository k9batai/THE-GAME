class Game < ApplicationRecord
  belongs_to :end_user
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { in: 15..300 }
  validates :category, presence: true, length: { maximum: 10 }
  validates :star, presence: true

  def self.search(search_word)
    Game.where(['category LIKE ?', "#{search_word}"])
  end

  def favorited?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end
end
