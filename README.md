# Hangman style serialization in Ruby

This is a project about serialization within Ruby. I have created a hangman style game where you have to guess a word that was selected by the computer. However the point of the game is to demonstrate serialization, or my knowledge of serialization so far, within Ruby. 

At anypoint in the game you can save your game state to a file on your computer. You can then completely close out the game and wait a few minutes, months, years, decades, centuries, eons or whatever you want, and then come back and load it right back up where you left off. 

##### I am following the curriculum over at [The Odin Project](https://www.theodinproject.com). I have alot of appreciation for the folks who run The Odin Project and for everyone who has helped me along the way so far. Consider dropping by even if only to say hi in the chatroom. Thanks for checking this out. 

## Instructions 
### 1. Copy this repo onto your computer. Open your terminal and simply copy and paste this text. 
```
$   git clone https://github.com/BShowen/ruby_terminal_hangman.git
```

### 2. cd into the lib folder and run 'main.rb'
first cd into the folder where you downloaded the repo and then cd into the "lib" directory. 
``` 
$   cd folder_where_repo_is_located
$   cd lib
```

### 3. Run main.rb to play the game by typing in this text. 
```
$   ruby main.rb
```

## Screenshots
### When you first load the game you will be greeted by this screen. Select a new game by typing "1" and hitting enter. 
![Intro photo](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/Intro.png "Intro screen")

## This is what the game looks like after I have made a few guesses. 
![Game play photo](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/game_play.png "Game play")

## At any point while youre playing you can save your game by typing "$" and hitting enter. You will be asked what type of file you would like to save. You can choose from YAML or JSON. Type in "1" or "2" and hit enter. 
![Choose file type](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/save_a_game.png "Choose your file type")

## After choosing your file type you will be prompted to name your file. Name it anything youd like. You dont have to include .Yaml or .Json at the end, but if you do its okay. Once you name your file simply hit enter and your game will be saved to the directroy "saved_games" in the root of the program directory. In this case I will be naming mine "new_save" and then hit enter. 
![Name your file](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/name_your_save_file.png "Naming a file type")

## Now that you have saved your game its time to load it back up and resume playing. Here is the greeting screen again. This time type in "2" to load a game. 
![Intro photo](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/Intro.png "Intro screen")


## Now it is asking you to choose the type of file you previously saved. If you saved a JSON file then type "2" and enter. If you saved a Yaml file type "1" and enter. 
![Choose file type](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/choose_a_load_file_type.png "Choose file type")

## The game will now scan the directory where the saved games are located and will populate the screen will all the files you can choose from. Type in the corresponding number and then hit enter. In this case I want to load "new_save.json" so I will type "1" and hit enter. If you had multiple saves then they would all populate on the screen and you could choose 1,2,3 and so on. 
![Choose a file](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/choose_a_load_file.png "Choose a file")

## Once you hit enter in the privous step you will be placed right back where you left off. In my case I was right here when I saved and now im right back here after loading up the game. 
![Loaded game](https://github.com/BShowen/ruby_terminal_hangman/blob/master/screenshots/game_play.png "Loaded game")