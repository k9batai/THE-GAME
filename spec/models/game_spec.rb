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
      it '20文字以下であること: 21文字はNG' do
        game.title = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと' do
        game.introduction = ''
        is_expected.to eq false
      end
      it '300文字以下であること: 301文字はNG' do
        game.introduction = Faker::Lorem.characters(number: 301)
        is_expected.to eq false
      end
      it '15文字以上であること: 14文字はNG' do
        game.introduction = Faker::Lorem.characters(number: 14)
        is_expected.to eq false
      end
    end

    context 'categoryカラム' do
      it '空欄でないこと' do
        game.category = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 11文字はNG' do
        game.category = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
    end

    context 'starカラム' do
      it '空欄でないこと' do
        game.star = ''
        is_expected.to eq false
      end
    end
  end
end