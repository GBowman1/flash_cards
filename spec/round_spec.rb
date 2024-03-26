require 'round'
require 'deck'
require 'card'
require 'turn'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Round do
    before(:each) do
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

    describe 'initialize' do
        it 'creates a new round with a deck' do
        expect(@round.deck).to eq(@deck)
        expect(@round.turns).to eq([])
        expect(@round.current_card).to eq(@card1)
        end
    end

    describe 'current_card' do
        it 'knows what the current card is' do

        expect(@round.current_card).to eq(@card1)
        end
    end

    describe 'take_turn' do
        it 'records turn and moves to the next card' do
            turn = @round.take_turn("Juneau")

            expect(turn).to be_a(Turn)
            expect(@round.turns.length).to eq(1)
            expect(@round.turns.last).to eq(turn)
            expect(@round.current_card).to eq(@card2)
        end
    end

    describe 'number_correct_by_category' do
        it 'keeps count of number correct for each category' do

            @round.take_turn('Dover')
            @round.take_turn('Mars')
            @round.take_turn('South South East')
            expect(@round.number_correct_by_category(:STEM)).to eq(1)
        end
    end

    describe 'percent_correct' do
        it 'returns percent correct' do

            @round.take_turn('Juneau')
            @round.take_turn('Mars')
            @round.take_turn('South South East')
            expect(@round.percent_correct).to eq(67)
        end
    end
end
