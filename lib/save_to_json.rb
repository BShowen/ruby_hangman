module Save_to_json

    def save_to_json
        json_data = self.to_json
        Dir.mkdir("../saved_games") unless File.exists? "../saved_games"
        puts "please name your file."
        file_name = clean_file_name_reply + ".json"
        File.open("../saved_games/#{file_name}",'w') do |file|
            file.write json_data
        end
    end

    def to_json
        JSON.dump({
            :hidden_word => @hidden_word,
            :turns_left => @turns_left,
            :players_previous_guess => @player.previous_guess,
            :computers_secret_word => @computer.secret_word
        })
    end

    def load_from_json
        data = get_json_files
        @hidden_word = data["hidden_word"]
        @turns_left = data["turns_left"]
        @player.previous_guess = data["players_previous_guess"]
        @computer.secret_word = data["computers_secret_word"]
        play_game
    end

    def get_json_files
        puts "Here are all the save files that you can choose from.\n"
        sleep 0.05
        files = Dir.glob("../saved_games/*.json").each_with_index do |filename,index|
            puts "#{index + 1}) #{ File.basename filename }"
        end
        puts "\nPlease type the number that corresponds with the file you wish to load."
        reply = clean_numeric_reply(files.count) - 1
        data = JSON.load(File.read(files[reply]))
        data
    end

end