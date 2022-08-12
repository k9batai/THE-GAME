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

end
