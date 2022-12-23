module StudioGame
    module Playable
        def strong?
            @health > 100
        end
        def woot
            puts "#{@name} wooted" 
            @health += 15
        end
        def blam
            puts "#{@name} blamed"
            @health -= 10
        end
    end
end