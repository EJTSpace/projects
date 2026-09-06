#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"

read MY_USERNAME
#Is user in database
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$MY_USERNAME';")
if [[ -z $USER_DATA ]]
then
  #If user has not been before
  echo -e "Welcome, $MY_USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$MY_USERNAME')")
  NO_OF_GAMES=0
  BEST_GAME=1000
else
  #If user has been before
  echo $USER_DATA
  IFS="|" read NO_OF_GAMES BEST_GAME <<< "$USER_DATA"
  echo -e "Welcome back, $MY_USERNAME! You have played $NO_OF_GAMES games, and your best game took $BEST_GAME guesses."
  
fi

RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
NO_OF_GUESSES=1
(( NO_OF_GAMES++ ))

echo "Guess the secret number between 1 and 1000: "
read GUESS

while [[ ! $GUESS =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    read GUESS
done

while [[ $GUESS != $RANDOM_NUMBER ]]
do
  if (( GUESS < RANDOM_NUMBER ))
then
  echo "It's higher than that, guess again:"
elif (( GUESS > RANDOM_NUMBER ))
then
  echo "It's lower than that, guess again:"
fi
 
(( NO_OF_GUESSES++ ))
read GUESS

while [[ ! $GUESS =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    read GUESS
done

done

#player has won
echo -e "You guessed it in $NO_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job! "

#update database with best game and no of games played
INSERT_GAME_RESULT=$($PSQL "UPDATE users SET games_played = $NO_OF_GAMES WHERE username='$MY_USERNAME';")

if (( NO_OF_GUESSES < BEST_GAME ))
then
INSERT_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NO_OF_GUESSES WHERE username='$MY_USERNAME';")	
fi