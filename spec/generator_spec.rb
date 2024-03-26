require 'round'
require 'deck'
require 'card'
require 'turn'
require 'card_generator'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe CardGenerator do
    before(:each) do
        @file = './lib/cards.txt'
    end

    it 'creates CardGenerator instance' do
        expect(CardGenerator.new(@file)).to be_a(CardGenerator)
    end
    
end