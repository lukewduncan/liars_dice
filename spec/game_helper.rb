$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "liars_dice.rb"

describe Game do
  before(:each) do
    @game = Game.new(4)
  end

  describe 'initialize' do
    it 'starts a new game with four players and 20 total dice' do
      @game.should be_an_instance_of Game
        expect(@game.players.size).to eq(4) 
        expect(@game.total_dice).to eq(20)
      end
    end

    describe '#move' do
      it 'player two should be able to make a move' do
        @game.move(1, 2, 3)
        @game.move(2, 3, 3)
        expect(@game.total_dice).to eq(15)
      end
    end

    describe '#claim' do
      it 'should have the correct probability that claim is correct' do
        @game.move(3, 2, 3)
      @game.move(4, 4, 3)
      @game.move(1, 5, 3)
      @game.move(2, 5, 3)
      @game.move(3, 3, 3)
      claim = @game.claim(20, 3)
          expect(claim).to eq(16.666666666666664)
      end
    end

    describe '#challenge' do
      it 'should determine if a claim is true or false' dox
        challenge = @game.challenge(19, 3)
        expect(challenge).to be false
      end
    end
end
