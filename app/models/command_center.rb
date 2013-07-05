class CommandCenter
  include HTTParty
  require 'json'

  attr_accessor :game_id, :x, :y

  base_uri "battle.platform45.com"

  def initialize(game_id, x, y)
    self.game_id = game_id
    self.x = x
    self.y = y
  end


  def self.start()
    response = HTTParty.post(base_uri+"/register", :body => { :name => "mcka1n", :email => "ermp@galileo.edu" }.to_json).to_json
    response_hash = JSON.parse(response)
    
    if response
      self.new response_hash['id'], response_hash['x'], response_hash['y']
    else
      # this just raises the net/http response that was raised
      raise response.response
    end

  end


end
