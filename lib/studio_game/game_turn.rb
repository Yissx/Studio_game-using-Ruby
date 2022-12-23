require_relative 'player'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'treasure_trove'

module StudioGame
    module GameTurn
        def self.take_turn(player)
            die = Die.new
            case die.roll
            when 5..6
                player.woot
            when 1..2
                player.blam
            else
                puts "#{player.name} skipped"
            end
            treasureRan = TreasureTrove.random
            player.found_treasure(treasureRan)
        end    
    end
end