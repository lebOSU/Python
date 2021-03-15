#! /bin/sh
#Mod06Homework
#Caleb Russell
#Code order spades diamonds clubs hearts

#declare and fill the four suits for the deck
declare -a spades=('Ace_of_Spades' 'King_of_Spades' \#declare -a for declaring array
            'Queen_of_Spades' 'Jack_of_Spades' \
            '10_of_Spades' '9_of_Spades' \
            '8_of_Spades' '7_of_Spades' \
            '6_of_Spades' '5_of_Spades' \
            '4_of_Spades' '3_of_Spades' \
            '2_of_Spades')

declare -a diamonds=('Ace_of_Diamonds' 'King_of_Diamonds' \
            'Queen_of_Diamonds' 'Jack_of_Diamonds' \
            '10_of_Diamonds' '9_of_Diamonds' \
            '8_of_Diamonds' '7_of_Diamonds' \
            '6_of_Diamonds' '5_of_Diamonds' \
            '4_of_Diamonds' '3_of_Diamonds' \
            '2_of_Diamonds')

declare -a clubs=('Ace_of_Clubs' 'King_of_Clubs' \
            'Queen_of_Clubs' 'Jack_of_Clubs' \
            '10_of_Clubs' '9_of_Clubs' \
            '8_of_Clubs' '7_of_Clubs' \
            '6_of_Clubs' '5_of_Clubs' \
            '4_of_Clubs' '3_of_Clubs' \
            '2_of_Clubs')
			
declare -a hearts=('Ace_of_Hearts' 'King_of_Hearts' \
            'Queen_of_Hearts' 'Jack_of_Hearts' \
            '10_of_Hearts' '9_of_Hearts' \
            '8_of_Hearts' '7_of_Hearts' \
            '6_of_Hearts' '5_of_Hearts' \
            '4_of_Hearts' '3_of_Hearts' \
            '2_of_Hearts')



#Four play suits initialized
declare -a playSpades=()
declare -a playDiamonds=()
declare -a playClubs=()
declare -a playHearts=()




#Shuffle function
#Menu choice 2
shuffle(){

	#initialize four variables to zero
	#amount of each suit missing from deck
	spades_gone=0
	diamonds_gone=0
	clubs_gone=0
	hearts_gone=0

	#Copy each original suit to a play suit
	playSpades=($spades[*])
	playDiamonds=($diamonds[*])
	playClubs=($clubs[*])
	playHearts=($hearts[*])
}



#Function to draw cards
draw_cards() {
	clear
	#check for valid input
	read -p "How many cards would you like to draw from this deck? " cards_requested#Cards requested is amount of cards user requested
	
	#Regex, regular expression check if input cards_requested NOT valid
	if ! [[ $cards_requested =~ ^[+]?[0-9] ]] 2>>/dev/null;then #2/dev/null filters errors
		clear
		echo -e "Invalid option.	Press Enter to return to the main menu: "
		read
		return
	fi

	
	#See if there are enough cards in the deck to meet the request
	#cards_remaining equals remaining of each suit
	cards_remaining=$(( ${#playSpades[@]} + ${#playDiamonds[@]} + ${#playClubs[@]} + ${#playHearts[@]}))
	#Stop user from requesting more cards than available
	if [[ $cards_requested -gt $cards_remaining ]];then
		clear
		echo -e "There are only $cards_remaining cards left in the deck but you have requested $cards_requested cards.\n"
		echo "Press the Enter key to return to the main menu: "
		read
		return
	fi
	





	#Print the requested cards
	echo -e "Your cards are:\n"
		#Loop and get the number of requested cards
		while [[ $cards_requested -gt 0 ]];
		do
			#check to see if all suits are empty
			if [[ spades_gone -eq 1 && diamonds_gone -eq 1 && clubs_gone -eq 1 && hearts_gone -eq 1 ]];then
				echo -e "All done\n"
				break
			fi


		#Get a random suit
		suit=$((RANDOM%4))#Assign a random value between 0 and 3 to a variable called suit
		
			#Spades
			if [[ $suit -eq 0 ]];then#if suit variable = 0, then choose and remove spades
				spades_gone=1
				continue
			else
				card=$((RANDOM%Suit_length))#chosen card is made by RANDOM modulus length of suit
				echo ${playSpades[$card]}
				playSpades=(${playSpades[*]:0:$card} ${playSpades[*]:$(($card + 1))})
				cards_requested=$(($cards_requested-1))#remove card from cards_requested
			fi

			#Diamonds
			elif [[ $suit -eq 1 ]];then#suit variable 1 choice = diamonds
				Suit_length=${#playDiamonds[@]}
				if [[ $suit_length -eq 0 ]];then
					diamonds_gone=1
					continue
					else
					card=$((RANDOM%Suit_length))
					echo ${playDiamonds[$card]}
					playDiamonds=${playDiamonds[*]:0:$card} ${playDiamonds[*]:$((card + 1))}
					cards_requested=$(($cards_requested-1))#remove card from cards_requested
				fi	


			#Clubs
			elif [[ $suit -eq 2 ]];then#suit variable 2 choice = clubs
				Suit_length=${#playClubs[@]}
				if [[ $Suit_length -eq 0 ]];then
					clubs_gone=1
					continue
					else
					card=$((RANDOM%Suit_length)
					echo ${playClubs[$card]}
					playClubs=(${playClubs[*]:0:$card} ${playClubs[*]:$(($card + 1))}
					cards_requested=$(($cards_requested-1))
				fi



			#Hearts
			else
				Suit_length=${#playHearts[@]}
				if [[ $Suit_length -eq 0 ]]; then
					hearts_gone=1
					continue
					else
						card=$((RANDOM%Suit_length))
						echo ${playHearts[$card]}
						playHearts=${playHearts[*]:0:$card} $playHearts[*]:$(($card + 1))})
						cards_requested=$(($cards_requested-1))
				fi
	
			fi
		done
		echo
		read -p "Press Enter to continue"
}


#Call new deck function
shuffle

#Menu
while true;
do	

	#Menu echo
	echo "
Welcome to the card deck simulator.
Please select from the following options:
	1.	Draw a selected number of cards from the current deck
	2.	Get a new deck of cards
	3.	Exit"


	#Decisions from menu
	read -p "Option#:" choice
		if [[ $choice -eq 1 ]];then
			draw_cards	
		elif [[ $choice -eq 2 ]];then
			shuffle
		elif [[ $choice -eq 3 ]];then
			clear
			break
		else
			read -p "That is not a valid selection.		Press Enter to continue:"
		fi
done
