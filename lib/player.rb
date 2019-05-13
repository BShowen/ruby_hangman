class Player
    attr_accessor :guess, :previous_guess
    def initialize 
        @previous_guess = []
        @guess = ""
    end

    def make_a_guess
        puts "Whats your guess?".center(120)
        clean_guess
    end

    def clean_guess
        begin
            @guess = gets.chomp[0].downcase
            raise if (previous_guess.include?(@guess) || !!@guess.match(/\d/) )
        rescue
            puts error_message
            retry
        else
            if @guess == "$"
                return @guess
            else
                @previous_guess << @guess
            end
        end
    end

    def error_message
        @guess.match(/\d/) ? "You cant guess a number. Try again.".center(120) : "You have already guessed #{@guess}. Try again.".center(120)
    end
end