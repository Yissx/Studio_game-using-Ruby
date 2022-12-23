require_relative 'player'
require_relative 'game_turn'

module StudioGame
    class Game 
        attr_reader :title, :players
        def initialize(title)
            @title = title
            @players = []
        end
        def high_score_entry(player)
            formatted_name = player.name.ljust(20, '.')
            "#{formatted_name} #{player.score}"
        end
        def save_high_scores(to_file="D:/Documentos/studio_game/high_scores.txt")
            File.open(to_file, 'w') do |file|
                file.puts "#{@title} high scores"
                @players.sort.each do |player|
                    file.puts high_score_entry(player)
                end
            end
        end
        def load_players(from_file)
            File.readlines(from_file).each do |line|
                add_player(Player.from_csv_new(line))
            end
            #puts players_name
        end
        def stats
            strong, wimpy = @players.partition { |player| player.strong? }
            puts "Strong players:"
            strong.each { |player| puts "   #{player.name}: #{player.health}"}
            puts "Wimpy players:"
            wimpy.each { |player| puts "    #{player.name}: #{player.health}"}
            puts ""
            @players.each do |player| 
                puts "#{player.name} total points: #{player.points}"
                player.each_found_treasure do |treasure|
                    puts "#{treasure.points} total #{treasure.name} points"
                end
            end
        end
        def add_player(name)
            @players << name
        end
        def to_s
            puts "\n#{@title}"
            @players.each do |player|
                puts player
            end
            puts ""
        end
        def sort_players
            @players.sort.each { |player| puts high_score_entry(player)}
        end
        def play(rounds)
            puts to_s
            1.upto(rounds) do |round|
                puts "\n round #{round}"
                @players.each do |player|
                    GameTurn.take_turn(player)
                end
            end
            puts to_s
        end
    end
end