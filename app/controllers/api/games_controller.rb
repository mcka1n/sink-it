class Api::GamesController < Api::BaseController
  respond_to :json

  def index 
    @games = Game.all
    render :json => @games
  end
  
  def create
    @game = Game.new
    @game.user_id = current_user.id
    start = CommandCenter.start()
    if start
      @game.game_api_id = start.game_id
      @game.save
      @game.x = start.x
      @game.y = start.y
    end
    @game
  end

  def fire
    @game = Game.find(params[:id])
    if @game
      @fire = CommandCenter.fire(params[:game])
    end
    @fire
  end
  
end
