require 'gosu'

class ScoreBoard
  def initialize
    @font = Gosu::Font.new(72, name: 'Arial')
    @score = 0
  end
  def draw
    @font.draw(@score, 0, 0, 1)
  end
  def update_score!(points)
  	@score += points 
  end
end
