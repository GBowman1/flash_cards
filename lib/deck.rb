class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def cards_in_category(category)
        category_cards = []
        @cards.each do |card|
            if card.category == category
                category_cards << card
            end
        end
    end

    def count
        @cards.length
    end
end