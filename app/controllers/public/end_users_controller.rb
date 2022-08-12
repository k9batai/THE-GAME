class Public::EndUsersController < ApplicationController

  def show
    @end_user = current_end_user
    @game = @end_user.games
  end

end
