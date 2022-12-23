require 'studio_game/player'

module StudioGame
    describe Player do
        before do
            @player = Player.new("larry", 67)
        end
        it "has a capitalized name" do
            expect(@player.name).to eq("Larry")
        end
        it "has an initial health" do
            expect(@player.health).to eq(67)
        end
        it "has a string representation" do
            @player.found_treasure(Treasure.new(:hammer, 50))
            @player.found_treasure(Treasure.new(:hammer, 50))
        
            @player.to_s.should == "I'm Larry with health = 67, points = 100 and score of 167"
        end
        it "computes a score as the sum of its health and points" do
            @player.found_treasure(Treasure.new(:hammer, 50))
            @player.found_treasure(Treasure.new(:hammer, 50))
        
            @player.score.should == 167
        end

        it "computes points as the sum of all treasure points" do
            @player.points.should == 0
        
            @player.found_treasure(Treasure.new(:hammer, 50))
        
            @player.points.should == 50
        
            @player.found_treasure(Treasure.new(:crowbar, 400))
        
            @player.points.should == 450
        
            @player.found_treasure(Treasure.new(:hammer, 50))
        
            @player.points.should == 500
        end
        it "yields each found treasure and its total points" do
            @player.found_treasure(Treasure.new(:skillet, 100))
            @player.found_treasure(Treasure.new(:skillet, 100))
            @player.found_treasure(Treasure.new(:hammer, 50))
            @player.found_treasure(Treasure.new(:bottle, 5))
            @player.found_treasure(Treasure.new(:bottle, 5))
            @player.found_treasure(Treasure.new(:bottle, 5))
            @player.found_treasure(Treasure.new(:bottle, 5))
            @player.found_treasure(Treasure.new(:bottle, 5))
        
            yielded = []
            @player.each_found_treasure do |treasure|
            yielded << treasure
            end
        
            yielded.should == [
            Treasure.new(:skillet, 200),
            Treasure.new(:hammer, 50),
            Treasure.new(:bottle, 25)
        ]
        end
        it "creates a new player from a cvs" do
            player = Player.from_csv_new("Moe,234")
            expect(player.health).to eq(234)
            expect(player.name).to eq("Moe")
        end
        context "Playing" do
            before do
                @player = Player.new("larry", 67)
                @initial_health = 67
            end
            it "increases health by 15 when wooted" do
                @player.woot
                expect(@player.health).to eq(@initial_health + 15)
            end
            it "decreases health by 10 when blammed" do
                @player.blam
                expect(@player.health).to eq(@initial_health - 10)
            end
        end
        context "Test driven development" do
            before do
                @player = Player.new("john", 150)
            end
            it "is strong" do
                expect(@player.strong?).to eq(true)
            end
            it "is strong in a different way" do
                @player.should be_strong
            end
        end
        context "Test driven development" do
            before do
                @player = Player.new("john", 80)
            end
            it "is not strong" do
                @player.should_not be_strong
            end
        end
        context "in a collection of players" do
            before do
            @player1 = Player.new("moe", 100)
            @player2 = Player.new("larry", 200)
            @player3 = Player.new("curly", 300)
        
            @players = [@player1, @player2, @player3]
            end
        
            it "is sorted by decreasing score" do
            @players.sort.should == [@player3, @player2, @player1]
            end
        end
    end
end