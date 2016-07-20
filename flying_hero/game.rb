require "gosu"
require_relative "background"
require_relative "hero"
require_relative "candy"
require_relative "asteroid_big"
require_relative "asteroid_small"
require_relative "score_board"

class Game < Gosu::Window
  def initialize
    super(988, 550, fullscreen: false)
    self.caption = "Flying hero!"
    @background = Background.new
    @hero = Hero.new
    @candy = Candy.new(self)
    @score_board = ScoreBoard.new 
    set_asteroid
  end

  def draw
    @background.draw
    @hero.draw
    @candy.draw
    @asteroid.draw
    @score_board.draw
  end

  def button_down(id)
		if id == Gosu::KbEscape
			close
		end
 	end
  def update
    @background.scroll!
    if button_down?(Gosu::KbDown)
      @hero.move_down! if (@hero.y + @hero.height) <= self.height
    end
    if button_down?(Gosu::KbUp) 
      @hero.move_up! if @hero.y >=0
    end
    @candy.move!
    if @candy.x < 0
       @candy.reset!(self)
    end
        @asteroid.move!
    if @asteroid.x < 0
      set_asteroid

    end 
    if @hero.bumped_into?(@candy)
       @candy.reset! (self)
       @score_board.update_score!(@candy.points)
    end 
        if @hero.bumped_into?(@asteroid)
       @asteroid.reset! (self)
       @score_board.update_score!(@asteroid.points)
    end  
  end

  def set_asteroid

    @asteroid = @asteroid && @asteroid.instance_of?(AsteroidBig) ?
    AsteroidSmall.new(self) : AsteroidBig.new(self)
  end
end
