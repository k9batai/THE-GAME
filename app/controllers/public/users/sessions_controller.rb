class Public::Users::SessionsController < Devise::SessionsController

  #ゲストログイン
  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to mypage_path(end_user), notice: 'ゲストユーザーとしてログインしました。'
  end

end