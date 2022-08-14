class Public::EndUsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = current_end_user
    @game = @end_user.games
  end

  private

  def ensure_guest_user
    @end_user = current_end_user
    if @end_user.name == "ゲストユーザー"
      redirect_to mypage_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
