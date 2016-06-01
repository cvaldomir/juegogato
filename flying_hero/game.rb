require "gosu"
class Game < Gosu::Window

    def initialize
         super(988, 550, fullscreen: false)
         self.caption = "Flying hero!"
     end

    def draw
    end	

    def button_down(id)
   			if id == Gosu::KbEscape
   				close
   			end	
   	end			

end