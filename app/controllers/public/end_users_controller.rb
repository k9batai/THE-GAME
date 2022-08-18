class Public::EndUsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def show
    @end_user = current_end_user
    @game = @end_user.games.page(params[:page]).per(3)
  end

  def edit
    @end_user = current_end_user
  end

  def update
    end_user = current_end_user
    if end_user.update(end_user_params)
      redirect_to mypage_path
    else
      @end_user = current_end_user
      render :edit
    end
  end

  def withdraw
    @end_user = current_end_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email)
  end


  def ensure_guest_user
    @end_user = current_end_user
    if @end_user.name == "ゲストユーザー"
      redirect_to mypage_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
