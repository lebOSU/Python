#! /bin/sh
#Caleb Russell
#Mod 05 Homework
clear
COIN_1=5
COIN_2=10
COIN_3=25
BASE_PRICE=85
remaining=$((BASE_PRICE+((RANDOM%7)*5)))

echo -e "Welcome to the Soda Machine. You can enter values of $COIN_1, $COIN_2, or $COIN_3 in payment. \n"
read -p "What type of soda would you like?: " soda_choice

		if [[ $remaining -eq 100 ]];then
			echo -e "\nThe current price of $soda_choice is \$1.00.\n"
		else
			echo -e "\nThe current price of $soda_choice is $remaining cents.\n"
		fi



while true;
	do
		
		if [[ $remaining -lt 0 ]];then
			echo -e "You have been refunded $((-$remaining)) cents."
			echo -e "Your $soda_choice is being dispensed.\n"
			echo -e "Thank you!"
			read -p "Press the enter key to close the script "
			break
		elif [[ $remaining -eq 0 ]];then
			echo -e "Your $soda_choice is being dispensed.\n"
			echo -e "Thank you!"
			read -p "Press the enter key to close the script "
			break
		fi
	
			
		echo -e "You still owe $remaining cents. \n"
		read -p "Enter a coin: " coin_choice
		
		if [[ $coin_choice -eq $COIN_1 ]];then
			remaining=$((remaining-$COIN_1))
			echo "You have inserted a nickel."	
		elif [[ $coin_choice -eq $COIN_2 ]];then
			remaining=$((remaining-$COIN_2))
			echo "You have inserted a dime."
		elif [[ $coin_choice -eq $COIN_3 ]];then
			remaining=$((remaining-$COIN_3))
			echo "You have inserted a quarter."
		else
			echo "That is not a valid amount."
		fi

	done

#Pseudocode
#Greet user
#Explain user can use 5, 10, or 25 payment
#	If input NOT 5, 10, or 25:
#	Explain payment is unacceptable
#	Repeat ask payment
#Ask user for type of soda
#Tell soda price to user






#SCRIPT MUST RUN AND LOOK EXACTLY LIKE DR. BURKMAN'S
#You are making a script to pyrchase a soda.
#Your user can enter 5 for a nickel, 10 for a dime, and 25 for a quarter
#Ensure that they can only enter these amounts using if/elif/elif/else .
#The base price of a soda is $1.00, but we'll set a random price prior to each soda purchase.
#We will vary the price by 0, 5, 10, or 15 centers in either direction from $1.00 .
#Remember your shebang, name, and "Mod 05 Homework" at the top of your script.
