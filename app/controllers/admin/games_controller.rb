class Admin::GamesController < ApplicationController

  def index
    @games = Game.page(params[:page]).per(10)
  end

  def show
    @game = Game.find(params[:id])
    @game_comments = @game.game_comments
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to admin_games_path, notice: '投稿を削除しました。'
  end

end
