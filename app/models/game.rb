class Game
  include Mongoid::Document

  field :user_id, :type => String
  field :game_status, :type => String, :default => "playing"
  field :prize, :type => String, :default => ""

  belongs_to :user

end
