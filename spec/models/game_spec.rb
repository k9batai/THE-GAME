require 'rails_helper'

RSpec.describe 'Gameモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { game.valid? }

    let!(:game) { build(:game) }

    context 'titleカラム' do
      it '空欄でないこと' do
        game.title = ''
        is_expected.to eq false
      end
      it '20文字以下であること: 20文字はOK' do
        game.title = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はNG' do
        game.title = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空腹でないこと' do
        game.introduction = ''
        is_expected.to eq false
      end
    end
  end
end