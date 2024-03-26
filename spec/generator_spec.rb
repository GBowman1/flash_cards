require 'round'
require 'deck'
require 'card'
require 'turn'
require 'card_generator'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe CardGenerator do
    
    it 'creates CardGenerator instance' do
        file = './lib/cards.txt'

        expect(CardGenerator.new(file)).to be_a(CardGenerator)
    end
    
    it 'creates a card from a line' do
        file = './lib/cards.txt'
        card_generator = CardGenerator.new(file)

        line = "What 5 + 5?,10,Math"
        card = card_generator.create_card(line)
        expect(card).to be_a(Card)
        expect(card.question).to eq("What 5 + 5?")
        expect(card.answer).to eq("10")
        expect(card.category).to eq("Math")
    end

    it 'returns an array of cards' do
        file = './lib/cards.txt'
        card_generator = CardGenerator.new(file)

        cards = card_generator.cards
        expect(cards).to be_an(Array)
        expect(cards.all? { |card| card.is_a?(Card) }).to be_truthy
    end

end