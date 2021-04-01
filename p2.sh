#! /bin/sh
#Caleb Russell
#alert_full_short.pcap
#Project 2
#RESUME AT MENU FUNCTION 1
#	powerpoints
#	past solutions
#	Burkman's demo video
#	To-do list .docx
clear
#Descriptor string
major_descriptors="BAD-TRAFFIC,DNS SPOOF,ET CURRENT_EVENTS,ET DNS,ET INFO,ET MALWARE,ET POLICY,ET TROJAN,ET WEB_CLIENT,ICMP,INFO,SCAN,WEB-IIS"

#Code order
#	DONE	Shebang #! /bin/sh
#	DONE	Descriptor string
#	Menu choice 1 function
#	Menu choice 2 function
#	Menu choice 3 function
#	Menu choice 4 function

#Menu choice 1 function			Parse alert data
menu_choice_1 () {
clear
echo "Please be patient. Parsing data..."
#open your good data file in your student directory
#name it alert_full_short_cleaned.csv
#write the header
header="Date,Time,Priority,Classification,Description,Packet Type,Source IP,Destination IP,Destination Port"
echo $header > ~/alert_full_short_cleaned.csv
#description
	input=~/alert_full_short.pcap
	while IFS= read -r line
	do
		#sample ET INFO JAVA - Java Archive Download By Vulnerable Client
		#if [[ $line == \[\*\*\]* ]];then
			 
	done
}

#Menu choice 2 function			Major descriptors
menu_choice_2 () {
true;
clear
}

#Menu choice 3 function			Classifications
menu_choice_3 () {
clear
echo "This is hateful to do in bash. Hard pass."
}


#Menu choice 4 function			Clean up and exit
menu_choice_4 () {
true;
clear
choice4name="Russell,Caleb"
choice4name=$(echo $choice4name | tr "," "_")
choice4name+=".tgz"
}


#Main code body:
#	Create major descriptors array
#	Name strings
#		MY_NAME="Caleb Russell"
#		Split that variable to make a variable for last name and for first name
#		Use these variables when making the final .tgz file
#	Data file check
#	Menu
#		use a single echo statement, then IF/ELIF/ELSE for options
#		catch invalid options and have the user try again

#Create major descriptors array
declare -a major_descriptors_array=()
major_descriptors_array=$(echo $major_descriptors | tr "," " ")
#for i in ${major_descriptors_array[*]};
#	do
#		echo $i
#	done


#Name strings
MY_NAME="Caleb Russell"
first_name=$(echo $MY_NAME | cut -d " " -f 1)
last_name=$(echo $MY_NAME | cut -d " " -f2)
#echo $first_name
#echo $last_name


#Data file check
FILE=~/alert_full_short.pcap.tgz
#actively check to see if FILE is in the home directory ~
#if the file is there, unzip the contents to the home director
if [[ -f "$FILE" ]];then
	cd ~/
	tar -xzf $FILE
#if it is not, tell the user to put the file there and to restart the script
else
	echo "alert_full_short.pcap.tgz is missing from your home directory."
	echo "Please place the file there, and restart the script."
	read -p
	exit 
fi





#Menu
while true;
do
	echo "
-----MAIN MENU-----
Please select from the following options...

1.	Parse alert data
2.	Major descriptors
3.	Classifications
4.	Clean up and exit	

"

read -p "Option #: " user_menu_choice
if [[ $user_menu_choice -eq 1 ]];then
	menu_choice_1
elif [[ $user_menu_choice -eq 2 ]];then
	menu_choice_2
elif [[ $user_menu_choice -eq 3 ]];then
	menu_choice_3
elif [[ $user_menu_choice -eq 4 ]];then
	menu_choice_4
else
	clear
	echo "That is not a valid option.	Please try again."
	continue
fi

done
