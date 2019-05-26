require "yaml"
require "json"
require "./save_to_yaml"
require "./save_to_json"
require "./player.rb"
require "./computer.rb"



class Game
    include Save_to_yaml
    include Save_to_json
    
    def initialize
        @computer = Computer.new
        @player = Player.new 
        @hidden_word = []
        generate_hidden_word
        @turns_left = 15
    end

    def intro
        clear_screen
        puts "WELCOME TO HANGMAN\n".center(120)
        puts "Would you like to start a new game or load a saved game?\n".center(120)
        puts "1. New game || 2. Load game".center(120)
        reply = clean_numeric_reply(2)
        case reply
        when 1
            instructions
            play_game
        when 2
            load_game
        end
    end 

    def instructions
        clear_screen
        puts "HANGMAN. By Bradley_Showen.".center(120)
        puts "You will have 15 attempts to guess the hidden word chosen by the computer.\n".center(120)
        puts "At anypoint in the game you can type \"$\" to save the current game.\n".center(120)
        puts "Press enter to continue.".center(120)
        reply = gets.chomp
    end

    def play_game
        until game_over?  do
            clear_screen
            print_hidden_word
            # puts "\nYou have #{@turns_left} turns left. Hint: the word is \"#{@computer.secret_word}\""
            puts "\nYou have #{@turns_left} turns left. Hint: The word is a boys name.".center(120)
            puts "\nPrevious guess:[ #{@player.previous_guesses.join(" ").upcase} ]"
            puts "\nYou can save at anypoint by typing \"$\""
            @player.make_a_guess
            break if player_wants_to_save?(@player.players_current_guess)
            populate_hidden_word(@player.players_current_guess)
            @turns_left -= 1
        end
    end

    def clear_screen
        puts `clear`
    end

    def player_wants_to_save?(players_reply)
        if players_reply == "$"
            save_to_json_or_yaml
            true
        else
            false
        end
    end

    def save_to_json_or_yaml
        clear_screen
        puts "What type of file do you want to save?\n 1. Yaml || 2. JSON"
        reply = clean_numeric_reply(2)
        clear_screen
        reply == 1 ? save_to_yaml : save_to_json
    end

    def load_game
        clear_screen        
        puts "What type of file do you want to load from? 1. Yaml || 2. JSON"
        reply = clean_numeric_reply(2)
        clear_screen
        reply == 1 ? load_from_yaml : load_from_json         
    end

    def populate_hidden_word(players_current_guess)
        if @computer.correct_guess?(players_current_guess)
            @computer.correct_guess?(players_current_guess).each do |index|
                @hidden_word[index] = players_current_guess
            end
        end
    end

    def print_hidden_word
        puts "The secret word is: #{@hidden_word.join(" ").upcase}".center(120)
    end

    def clean_numeric_reply(max_value)
        begin
            $reply = gets.chomp[0..max_value].match(/\d+/)[0]
            raise if $reply.to_i > max_value || $reply == nil
        rescue
            puts "Invalid entry. Please try again."
            retry
        end
        $reply.to_i
    end

    def clean_file_name_reply
        file_name = gets.chomp
        file_name.gsub!(/\.yaml|\.json/,"")
        file_name
    end

    def game_over?
        clear_screen
        # boolean = @secret_word == @hidden_word || !@hidden_word.include?("_") 
        # boolean ? true : false
        if @secret_word == @hidden_word || !@hidden_word.include?("_") 
            puts "Nice job!".center(120)
            true
        elsif @turns_left == 0
            puts "Sorry, you lost. The secret word was #{@computer.secret_word}".center(120)
            true
        else
            false
        end
    end

    def generate_hidden_word
        @computer.secret_word.length.times do
                @hidden_word << "_"
        end
    end

end

game = Game.new
game.intro