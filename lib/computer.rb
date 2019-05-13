class Computer
    attr_accessor  :secret_word

    def initialize
        @words = File.read("words.txt").split("\n")
        @secret_word = ""
        select_a_secret_word
    end

    def select_a_secret_word
        until @secret_word.length >= 5 do
            @secret_word = @words[rand(0..@words.length)].downcase
        end
    end

    def correct_guess?(guess)
        if @secret_word.include? guess
            correct_guess_indexes(guess)
        else
            false
        end
    end

    def correct_guess_indexes(guess)
        correctly_guessed = []
        @secret_word.split("").each_with_index do |letter,index|
            letter == guess ? correctly_guessed << index : next
        end
        correctly_guessed
    end

end