require 'studio_game/game'
require 'studio_game/game_turn'

module StudioGame
    describe Game do
        context "Rolling a number" do
            before do
                @game = Game.new("Clasico")
                @initial_health = 120
                @player1 = Player.new("John", @initial_health)
                @game.add_player(@player1)
            end
            it " a high number" do
                #allow_any_instance_of(GameTurn).to receive(:roll).and_return(5)
                #GameTurn.stub(:roll).and_return(5)
                allow(GameTurn).to receive(:roll).and_return(5)
                @game.play(1)
                expect(@player1.health).to be(@initial_health += 15)
            end
            it " a low number" do
                allow(GameTurn).to receive(:roll).and_return(1)
                @game.play(1)
                expect(@player1.health).to be(@initial_health -= 10)
            end
            it " a middle number" do
                allow(GameTurn).to receive(:roll).and_return(3)
                @game.play(1)
                expect(@player1.health).to be(@initial_health)
            end
        end
        it "assigns a treasure for points during a player's turn" do
            game = Game.new("Knuckleheads")
            player = Player.new("moe")
        
            game.add_player(player)
        
            game.play(1)
        
            player.points.should_not be_zero
        
            # or use alternate expectation syntax:
            # expect(player.points).not_to be_zero
        end
    end
end