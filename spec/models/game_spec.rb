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
      it 'introductionカラム' do
        game.introduction = ''
        is_expected.to eq false
      end
    end
  end
end