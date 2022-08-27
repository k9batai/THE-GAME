class Public::FavoritesController < ApplicationController

  #いいねボタン
  def create
    @game_favorite = Favorite.new(end_user_id: current_end_user.id, game_id: params[:game_id])
    @game_favorite.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @game_favorite = Favorite.find_by(end_user_id: current_end_user.id, game_id: params[:game_id])
    @game_favorite.destroy
    redirect_back fallback_location: root_path
  end
end
