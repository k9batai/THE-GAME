class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest_user@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
    
  end
end
