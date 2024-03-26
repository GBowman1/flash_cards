require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator.rb'

# card1 = Card.new("What is 5 + 5?", "10", :Math)
# card2 = Card.new("What is Rachel's favorite animal?", "panda", :Turing_Staff)
# card3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
# card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
# cards = [card1, card2, card3, card4]
# deck = Deck.new(cards)
file = './lib/cards.txt'
cards = CardGenerator.new(file).cards
deck = Deck.new(cards)
round = Round.new(deck)

def start(deck)
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    round = Round.new(deck)
    deck.cards.each_with_index do |card, index|
        puts "This is card number #{index + 1} out of #{deck.count}."
        puts "Question: #{card.question}"
        
        guess = gets.chomp.downcase
        turn = round.take_turn(guess)
        
        puts turn.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}%."
    deck.cards.each do |card|
        puts "#{card.category}: #{round.percent_correct_by_category((card.category))}%"
    end
end

start(deck)