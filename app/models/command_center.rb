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
    puts current_user.name
    puts current_user.email
    response = HTTParty.post(base_uri+"/register", :body => { :name => current_user.name, :email => current_user.email }.to_json).to_json
    response_hash = JSON.parse(response)
    
    if response
      self.new response_hash['id'], response_hash['x'], response_hash['y']
    else
      # this just raises the net/http response that was raised
      raise response.response
    end

  end

  def self.fire(game_id, x, y)
    response = HTTParty.post(base_uri+"/nuke", :body => { :id => game_id, :x => x, :y => y}.to_json).to_json
    response_hash = JSON.parse(response)
  end


end
