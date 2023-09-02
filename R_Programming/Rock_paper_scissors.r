RPS = c('ROCK','PAPER','SCISSORS')
Win = 0
Lose = 0
Draw = 0


GamebotRPS <- function() {
  print("Welcome to the Rock-Paper-Scissors game. Enjoy playing!")
  print("Do you want to play? Enter 'YES' or 'NO'.")
  
  PlayGame <- as.character(toupper(readline()))
  
  if(PlayGame == "NO"){
    return("You so lucky to day.Nice to see you")
  }else if(PlayGame == "YES"){
    print("welcome to Game of the hell")
    print("We well explan this game")
    print("You select someone we have 'ROCK','PAPER','SCISSORS'")
    print("Rock win scissors,Paper win Rock,Scissors win Paper")
    print("We have a professional this game.you don't hope to win so easily")
    print("Are you ready?.Can choose number in a choice")
    print("1.Rock")
    print("2.PAPER")
    print("3.SCISSORS")
    print("During play you want to go out The hell can write 'q' or 'quit'")
    
    while (TRUE) {
      Select <- as.character(toupper(readline()))
      Bot <- as.character(sample(RPS,1))
      if(Select == 'ROCK' |Select == 'PAPER'|Select == 'SCISSORS')
        {if(Select == Bot ){
          Draw <- Draw+1
          print(paste("You choose",Select,"We Choose",Bot,"You Draw"))
      }else if(Select =="SCISSORS" & Bot == "PAPER" ){
        Win <- Win+1
        print(paste("You choose",Select,"We Choose",Bot,"You Win"))
      }else if(Select =="PAPER" & Bot == "SCISSORS" ){
        Lose <- Lose+1
        print(paste("You choose",Select,"We Choose",Bot,"You Lose"))
      }else if(Select =="ROCK" & Bot == "SCISSORS" ){
        Win <- Win+1
        print(paste(Select,Bot,"You Win"))
      }else if(Select =="SCISSORS" & Bot == "ROCK" ){
        Lose <- Lose+1
        print(paste("You choose",Select,"We Choose",Bot,"You Lose"))
      }else if(Select =="PAPER" & Bot == "ROCK" ){
        Win <- Win+1
        print(paste("You choose",Select,"We Choose",Bot,"You Win"))
      }else if(Select =="ROCK" & Bot == "PAPER" ){
        Lose <- Lose+1
        print(paste("You choose",Select,"We Choose",Bot,"You Lose"))
      }
      }else if (Select == 'Q'|Select == 'QUIT'){
        print("You so good and this your score")
        print(paste('You win:',Win))
        print(paste('You lose:',Lose))
        print(paste('You draw:',Draw))
        print(paste('Total you play my game:',Win+Lose+Draw))
        break
      }
    }
  }
}

GamebotRPS()
