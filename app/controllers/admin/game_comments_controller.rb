class Admin::GameCommentsController < ApplicationController

  def destroy
    GameComment.find_by(id: params[:id], game_id: params[:game_id]).destroy
    redirect_to request.referer
  end
end
