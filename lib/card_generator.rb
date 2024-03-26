class CardGenerator
    attr_reader :file

    def initialize(file)
        @file = file
    end
    
    def create_card(line)
        string_to_arr = line.chomp.split(',')
        question = string_to_arr[0]
        answer = string_to_arr[1]
        category = string_to_arr[2]
        Card.new(question, answer, category)
    end

    def cards
        lines = File.readlines(file)
        lines.map { |line| create_card(line) }
    end

end