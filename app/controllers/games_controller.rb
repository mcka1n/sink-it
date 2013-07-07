class GamesController < ApplicationController
  before_filter :authenticate_user!  
  def index

  end
  
  def start_game
    @game = CommandCenter.start()
  end

  def fire
    @fire = CommandCenter.fire(params[:game])
    @fire.x
  end

end
