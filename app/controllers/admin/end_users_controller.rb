class Admin::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def destroy
    end_user = EndUser.find(params[:id])
    end_user.destroy
    redirect_to admin_end_users_path
  end

  def status
    end_user = EndUser.find_by(params[:id])
    if end_user.is_valid == true
      end_user.update(is_valid: false)
    else
      end_user.update(is_valid: true)
    end
    redirect_to admin_end_users_path
  end


end
