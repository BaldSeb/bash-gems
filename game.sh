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
    echo "You study hard for the test."
  energy=$((energy - 10))
  study_points=$((RANDOM % 16 + 10))
knowledge=$((knowledge + study_points))
echo "You gained $study_points intelligence!"
  stress=$((stress + 5))
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

    if [ "$knowledge" -ge 80 ] && [ "$stress" -lt 80 ]; then
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