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
major_descriptors=$( echo $major_descriptors | tr " " "_" )
major_descriptors=$( echo $major_descriptors | tr "," " " )

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
header="Date,Time,Priority,Classification,Description,Packet Type,Source IP,Source Port,Destination IP,Destination Port"

echo $header > ~/alert_full_short_cleaned.csv
#description
	input=~/alert_full_short.pcap
	while IFS= read -r line;
	do
		#sample ET INFO JAVA - Java Archive Download By Vulnerable Client
		if [[ $line == \[\*\*\]* ]];then
			firstline=$(echo $line | cut -d "[" -f 3)
			firstline=$(echo $firstline | cut -d "]" -f 2)
			#firstline=$(echo $firstline: -1:)
			description=$(echo $firstline | tr " " "_") #Data now is string with underscores
			#echo $description
			#read

		#Classification	
		elif [[ $line == **"Classification"* ]];then
			firstline=$(echo $line | cut -d "[" -f 2)
			firstline=$(echo $firstline | cut -d ":" -f 2) #cut and now firstline is everything after Classification:
			firstline=$(echo $firstline | cut -d "]" -f 1)
			classification=$(echo $firstline | tr " " "_")
			#echo $classification
			#read

			#Priority
			firstline=$(echo $line | cut -d "[" -f 3)
			firstline=$(echo $firstline | cut -d " " -f 2)
			priority=$(echo $firstline | cut -d "]" -f 1)
			#echo $priority
			#read 
		
		#Date, Time, IPs	
		elif [[ $line == **-\>* ]];then
			#echo "debug"
			firstline=$(echo $line | cut -d " " -f 2) #source IP and port

			#Source IP and port
			source_ipport=$firstline
			if [[ $source_ipport == **:* ]];then
				#Source IP
				source_ip=$(echo $source_ipport | cut -d ":" -f 1)			
				#Source Port
				source_port=$(echo $source_ipport | cut -d ":" -f 2)
			
			else
				source_port="Unspecified"
				source_ip=$source_ipport
			fi				
			#echo $source_ip
			#echo $source_port

			#Date+Time
			firstline=$(echo $line | cut -d " " -f 1)
			#echo $firstline
			date=$(echo $firstline | cut -d "-" -f 1)
			time=$(echo $firstline | cut -d "-" -f 2)
			time=$(echo $time | cut -d "." -f 1)
			#echo $date
			#echo $time
			#read

			#Destination IP and port
			destination_ipport=$(echo $line | cut -d " " -f 4)
			if [[ $destination_ipport == **:* ]];then
				destination_ip=$(echo $destination_ipport | cut -d ":" -f 1)
				destination_port=$(echo $destination_ipport | cut -d ":" -f 2)
			else
				destination_port="Unspecified"
				destination_ip=$destination_ipport
			fi
			#echo $destination_ip
			#echo $destination_port
			#read

			#Packet type
			elif [[ $line == **TCP* ]];then
				packet_type="TCP"
			elif [[ $line == **UDP* ]];then
				packet_type="UDP"
			#echo $packet_type
			#read
			

			#If new line in data then write
			elif [[ $line == "" ]];then
			#output header
				output="$date,$time,$priority,$classification,$description,$packet_type,$source_ip,$source_port,$destination_ip,$destination_port"
				echo $output >> ~/alert_full_short_cleaned.csv
				

		fi			 
	done < $input
}

#Menu choice 2 function			Major descriptors
#menu_choice_2 () {
#clear
#echo ${major_descriptors_array[*]}
#echo ${major_descriptors_array[0]}
#read
#user menu
#while true;
#	do
#
#	clear
#	echo "
#Enter one or more starting characters for your major descriptor: 
#or, enter nothing to see all major descriptors: 
#or, enter 'exit' to return to the main menu "
#read -p "Please enter your selection: " function2_choice
#function2_choice=$(function2_choice | tr " " "_")
#function2_choice=$(function2_choice | tr [:lower:] [:upper:])
#if [[ $function2_choice == "" ]];then
#	echo ${major_descriptors_array[*]}
#	echo "Press any key to continue"
#	read
#elif [[ $function2_choice == "EXIT" ]];then
#	break
#else	
#	function2_array=()
#	for i in ${major_descriptors_array[*]};
#		do
#			if [[ $i == function2_choice* ]];then
#				function2_array+=($i)
#			fi
#		done
#			#Arrays & Advanced Flow Control powerpoint
#			function2_array_len=${#function2_array[*]}
#			
#			if [[ $function2_array_len -gt 1 ]];then
#				echo "Multiple matches were found. Please be specific"
#				
#				for i in ${function2_array}[*]
#					do
#						#results 
#						marsupial=($(echo $i | tr "_" " "))
#						echo ${marsupial}[*]
#					done	
#					
#					read -p "The items listed all match the criteria. Press ENTER to continue: "
#			fi
#	#done
#
#}

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
if [[ -f $choice4name ]];then
	rm ~/$choice4name
fi
#BASH files and directories powerpoint
cd ~
#create russell_caleb pass two files and zip
tar -cf $choice4name alert_full_short.pcap alert_full_short_cleaned.csv -z
rm ~/alert_full_short.pcap
rm ~/alert_full_short_cleaned.csv
exit
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
major_descriptors_array=($(echo $major_descriptors | tr "," " "))

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
