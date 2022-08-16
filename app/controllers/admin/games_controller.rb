class Admin::GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @game_comments = @game.game_comments
  end

  def destroy
    game=Game.find(params[:id])
    game.destroy
    redirect_to admin_games_path
  end

end
