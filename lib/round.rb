class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0
        @correct_guesses = 0
    end

    def current_card
        @deck.cards[@current_card_index]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
            if turn.correct?
            @correct_guesses += 1
            end
        @current_card_index += 1
        turn
    end

    def number_correct
        @correct_guesses
    end

    def percent_correct
        total_percentage = (@correct_guesses.to_f / @turns.length) * 100
        total_percentage.round
    end

    def number_correct_by_category(category)
        count_correct = 0
        @turns.each do |turn|
            count_correct += 1 if turn.card.category == category && turn.guess == turn.card.answer
        end
        count_correct
    end
    


end