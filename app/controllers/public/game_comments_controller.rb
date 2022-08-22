class Public::GameCommentsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    game_comment = game.game_comments.new(game_comment_params)
    game_comment.end_user_id = current_end_user.id
    if game_comment.save
      redirect_to game_path(game), notice: 'コメントしました。'
    else
      @game=Game.find(params[:game_id])
      @game_comment = game_comment
      @game_comments = @game.game_comments.page(params[:page]).per(4)
      render 'public/games/show'
    end
  end

  def destroy
    GameComment.find_by(id: params[:id], game_id: params[:game_id]).destroy
    redirect_to game_path(params[:game_id]), notice: 'コメントを削除しました。'
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end

end
