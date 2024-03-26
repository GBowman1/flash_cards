class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_index = 0
        @correct_guesses = 0
        @correct_guesses_by_category = {}
        @total_guesses_by_category = {}
        category_hashes
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
        guess_counter(turn, current_card)
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
        @correct_guesses_by_category[category] || 0
    end

    def percent_correct_by_category(category)
        if @total_guesses_by_category[category] == 0
            0 
            #catch if categry total is 0 prevent NaN
        else
          (@correct_guesses_by_category[category].to_f / @total_guesses_by_category[category]) * 100
        end
    end

    def guess_counter(turn, current_card)
        if turn.correct?
            @correct_guesses_by_category[current_card.category] += 1
        end
        @total_guesses_by_category[current_card.category] += 1
    end

    def category_hashes
        @deck.cards.each do |card|
            @correct_guesses_by_category[card.category] = 0
            @total_guesses_by_category[card.category] = 0
        end
    end

end