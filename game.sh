#!/usr/bin/env bash

clear

echo "=============================="
echo "  THE LAST PIECE OF HOMEWORK"
echo "=============================="
echo
echo "Welcome, Smart one."

energy=100
knowledge=0
stress=0
snacks=2

echo
read -r -p "What is your name? " player_name
echo
echo "Welcome, $player_name. Youre about to be doing lots of work."

echo
echo "Choose difficulty:"
echo "1. Easy"
echo "2. Medium"
echo "3. Hard"

while true; do
    read -r -p "Difficulty: " difficulty

    if [ "$difficulty" == "1"]; then
        difficluty_name="Easy"
        quiz_questions=2
        wrong_penalty=3
        echo "You chose easy, are you lazy?"
        break
    elif [ "$difficulty" == "2" ]; then
        difficulty_name="Medium"
        quiz_questions=3
        wrong_penalty=5
        echo "You chose medium, finnaly a normal person."
        break
    elif [ "$difficulty" == "3" ]; then
        difficulty_name="Hard"
        quiz_questions=5
        wrong_penalty=10
        echo "You chose hard. Nice one!"
        break
    else
        echo "Invalid choice. Please choose 1, 2, or 3."
    fi
done


echo
echo "your stats are:"
echo "Energy: $energy"
echo "Knowledge: $knowledge"
echo "Stress: $stress"
echo "Snacks: $snacks"

echo
read -r -p "Press enter to continue..." enter

while true; do 

echo "1. Study for test"
echo "2. Take a nap"
echo "3. Eat a snack"
echo "4. Take the test"
echo "5. Quit"
echo
read -r -p "What is your choice? " choice


if [ "$choice" == "1" ]; then
    echo
    echo "STUDY QUIZ"
    echo "You will get 3 random questions."
    echo

    questions=(
        "What's 17x19?"
        "Which ancient civilization built Machu Picchu?"
        "Square root of 2025?"
        "What is the chemical symbol for tungsten?"
        "Whats 144 in Roman numerals?"
        "What planet has the shortest day?"
    )

    options=(
      # a
        $'a) 323\nb) 1719\nc) 351'
      # b
        $'a) Maya\nb) Incas\nc) Aztec'
      # c
        $'a) 25\nb) 35\nc) 45'
      # b  
        $'a) T\nb) W\nc) Tu'
      # b
        $'a) CLXIV\nb) CXLIV\nc) CCCXL'
      # b
        $'a) Mercury\nb) jupiter\nc) Uranus'
    )

    answers=("a" "b" "c" "b" "b" "b")

    correct=0
    total_points=0
    declare -A asked

    for ((question_number=1; question_number<=quiz_questions; question_number++)); do

        index=$((RANDOM % ${#questions[@]}))

        while [[ ${asked[$index]} == "yes" ]]; do
            index=$((RANDOM % ${#questions[@]}))
        done

        asked[$index]="yes"

        echo "Question $question_number:"
        echo "${questions[$index]}"
        printf '%b\n' "${options[$index]}"

        read -r -p "Answer: " answer

        if [ "$answer" == "${answers[$index]}" ]; then
            points=$((RANDOM % 16 + 10))
            echo "Correct! You gained $points knowledge."
            knowledge=$((knowledge + points))
            total_points=$((total_points + points))
            correct=$((correct + 1))
        else
            echo "Wrong!"
            echo "You lost $wrong_penalty knowledge and gained 5 stress."
            knowledge=$((knowledge - wrong_penalty))
            stress=$((stress + 5))
        fi

        echo
    done

    echo "You got $correct out of $quiz_questions correct."
    echo "Total knowledge gained: $total_points"
elif [ "$choice" == "2" ]; then
    echo "You take a nap and feel refreshed."
  energy=$((energy + 20))
  stress=$((stress - 10))
elif [ "$choice" == "3" ]; then
echo "You eat a snack and feel better."
  if [ "$snacks" -gt 0 ]; then
    snacks=$((snacks - 1))
    energy=$((energy + 15))
    stress=$((stress - 5))
  else
    echo "No snacks left! Fatty."
  fi
elif [ "$choice" == "4" ]; then
    echo
    echo "You take the test."
    echo

    if [ "$knowledge" -ge 120 ] && [ "$stress" -lt 70 ]; then
        echo "You passed the test!"
        echo "Your studying paid off."
        exit 0
    else
        echo "You did not pass this time."
        echo "Study more and try again."
        exit 0
    fi

elif [ "$choice" == "5" ]; then
  echo "Goodbye!"
  exit 0
else
  echo "Invalid choice. Please try again."
fi


if [ "$energy" -gt 100 ]; then
    energy=100
fi

if [ "$stress" -lt 0 ]; then
    stress=0
fi

echo
echo "------------------------------"
echo "Energy: $energy"
echo "Knowledge: $knowledge"
echo "Stress: $stress"
echo "Snacks: $snacks"
echo "Difficulty: $difficulty_name"
echo "------------------------------"
echo

if [ "$energy" -le 0 ]; then
    echo
    echo "You are too tired to study."
    echo "Game over."
    exit 1
fi

if [ "$stress" -ge 100 ]; then
    echo
    echo "You became too stressed to continue."
    echo "Game over."
    exit 1
fi

done