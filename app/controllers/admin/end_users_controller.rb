class Admin::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.page(params[:page]).per(10)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @games = @end_user.games.page(params[:page]).per(5)
  end

  def destroy
    end_user = EndUser.find(params[:id])
    end_user.destroy
    redirect_to admin_end_users_path
  end

  def status
    end_user = EndUser.find(params[:id])
    if end_user.is_valid == true
      end_user.update(is_valid: false)
    else
      end_user.update(is_valid: true)
    end
    redirect_to admin_end_users_path, notice: '会員情報を更新しました。'
  end


end
