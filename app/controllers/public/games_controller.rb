class Public::GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.end_user_id = current_end_user.id
    if @game.save
      redirect_to game_path(@game), notice: '投稿に成功しました。'
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @game_comments = @game.game_comments.page(params[:page]).per(4)
  end

  def index
    @q = Game.ransack(params[:q])
    @games = params[:q].present? ? @q.result.page(params[:page]).per(6) : Game.page(params[:page]).per(6)
  end

  def destroy
    @game=Game.find(params[:id])
    @game.destroy
    redirect_to mypage_path(current_end_user)
  end

  def edit
    @game=Game.find(params[:id])
    if @game.end_user.id!=current_end_user.id
       redirect_to mypage_path(current_end_user)
    end
  end

  def update
    @game=Game.find(params[:id])
    if @game.update(game_params)
      redirect_to mypage_path(current_end_user), notice: '更新しました。'
    else
      render :edit
    end
  end

  def search_game
    @q = Game.ransack(params[:q])
    @games = Game.search(params[:keyword]).page(params[:page]).per(6)
  end


  private

  def game_params
    params.require(:game).permit(:title, :introduction, :category)
  end


end
