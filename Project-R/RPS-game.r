#input player name
print("Welcome to Rock Paper Scissors Game!🔨✂️📃")
player_name <- readline("Enter Player Name: ")
greeting <- paste("Hello", player_name, "Let's RPS!")
print(greeting)

#game
game <- function() {
    game_round <- 1
    player_score <- 0
    computer_score <- 0

#loop
while (player_score < 3 & computer_score < 3) {
    choices <- c("rock", "paper", "scissors")
    computer_choice <- sample(choices, 1)
    player_choice <- readline("Chose rock, paper, scissors or exit: ")

        #draw
        if (player_choice == computer_choice) {
            print(paste("Computer: ", computer_choice))
            print(paste("Draw!", player_score, "vs", computer_score))
        }

        #win
        else if (
                  (player_choice == "rock" & computer_choice == "scissors") |
                  (player_choice == "paper" & computer_choice == "rock") |
                  (player_choice == "scissors" & computer_choice == "paper"))
            {
            player_score = player_score + 1
            print(paste("Computer: ", computer_choice))
            print(paste("You Wins!", player_score, "vs", computer_score))
        }

        #lose
        else if ((player_choice == "rock" & computer_choice == "paper") |
                  (player_choice == "paper" & computer_choice == "scissors") |
                  (player_choice == "scissors" & computer_choice == "rock"))
            {
            computer_score = computer_score + 1
            print(paste("Computer: ", computer_choice))
            print(paste("You Lose!", player_score, "vs", computer_score))
        }
        else {
            print("Exit the game")
        }
    flush.console()
    if (player_choice == "exit") {break}
}

#print score
print(paste(player_score, "vs", computer_score))

#conclusion
    if (player_score > computer_score) {
        print("Congratulations! You win the game!🏆")
    } else if (player_score < computer_score) {
        print("Sorry, you lose. Better luck next time!🥹")
    } else if (player_score == computer_score) {
        print("It's a draw! Good game.✨")
    }
    print("-----END GAME-----")
}

game()
