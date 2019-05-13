class Player
    attr_accessor :players_current_guess, :previous_guesses
    def initialize 
        @previous_guesses = []
        @players_current_guess = ""
    end

    def make_a_guess
        puts "Whats your guess?".center(120)
        clean_guess
    end

    def clean_guess
        begin
            @players_current_guess = gets.chomp[0].downcase
            raise if (@previous_guesses.include?(@players_current_guess) || !!@players_current_guess.match(/\d/) )
        rescue
            puts error_message
            retry
        else
            if @players_current_guess == "$"
                return @players_current_guess
            else
                @previous_guesses << @players_current_guess
            end
        end
    end

    def error_message
        @players_current_guess.match(/\d/) ? "You cant guess a number. Try again.".center(120) : "You have already guessed #{@players_current_guess}. Try again.".center(120)
    end
end