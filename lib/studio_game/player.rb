require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
    class Player
        include Playable
        attr_reader :health
        attr_accessor :name
        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
        end
        def each_found_treasure
            @found_treasures.each do |name, points|
                yield(Treasure.new(name, points))
            end
        end
        def found_treasure(treasure)
            @found_treasures[treasure.name] += treasure.points
            puts "#{@name} found a worth #{treasure.points} #{treasure.name}"
            puts "Found treasures: #{@found_treasures}"
        end
        def points
            @found_treasures.values.reduce(0, :+)
        end
        def <=>(otroJugador)
            otroJugador.score <=> score
        end
        def to_s
            "I'm #{@name} with health = #{@health}, points = #{points} and score of #{points+@health}"
        end
        def score
            @health + points
        end
        def self.from_csv_new(string)
            name, health = string.split(',')
            Player.new(name, Integer(health))
        end     
    end
end

if __FILE__ == $0
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.woot
    puts player.health
    player.blam
    puts player.health
end