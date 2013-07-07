class Api::GamesController < Api::BaseController
  respond_to :json

  def index 
    @games = Game.all
    render :json => @games
  end
  
  def start_game
    @game = CommandCenter.start()
  end

  def fire
    @fire = CommandCenter.fire(params[:game])
    @fire.x
  end
  
end
