require_relative 'player'

module StudioGame
    class BerserkPlayer < Player
        def initialize(name, health=100)
            super
            @w00t_count = 0
        end
        def berserk?
            @w00t_count > 5
        end
        def woot 
            super
            @w00t_count += 1
            puts "Berserker is berserk" if berserk?
        end
        def blam
            berserk? ? woot : super
        end
    end

    if __FILE__ == $0
        berserker = BerserkPlayer.new("berserker", 50)
        6.times { berserker.woot }
        2.times { berserker.blam }
        puts berserker.health
    end
end