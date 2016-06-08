require "gosu"
require_relative "background"

class Game < Gosu::Window
  def initialize
    super(988, 550, fullscreen: false)
    self.caption = "Flying hero!"
    @background = Background.new
  end

  def draw
    @background.draw
  end

  def button_down(id)
		if id == Gosu::KbEscape
			close
		end
 	end
  def update
    @background.scroll!
  end
end
