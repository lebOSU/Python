#! /bin/sh

RandoInsert () {
	myArrayLength=${#myArray[*]}
	indexPosition=$(( ($RANDOM%myArrayLength) ))
	myArray=(${myArray[*]:0:$indexPosition} "$1" ${myArray[*]:$indexPosition})


}
#This was my test array
#declare -a myArray=(44 seven 7 120 monkey cat heck 3.1 -1382 banana)
clear
read -p "Press enter to move from task to task"
clear

#Task 1 Fill the array with user input
echo -e "Task 1 \n"
echo "Create an array filled with 10 items"
echo -e "Be sure to get a mix of floating point numbers, integers and text\n"
inputCounter=0
while [[ $inputCounter -lt 10 ]];
do
	read -p "Please enter a number or word for index position $inputCounter: " userInput
	userInput=$( echo $userInput | tr " " "_")
	myArray+=($userInput)
	inputCounter=$(($inputCounter+1))
done
read
clear

#Task 2 Print the length of the array
echo -e "Task 2\n"
myArrayLength=${#myArray[*]}
echo "This array has $myArrayLength items"
read 
clear

#Task 3 Print out the array
echo -e "Task 3\n"
echo -e "This is the array:\n"
echo ${myArray[*]}
read


#Task 4 Swap the first item with the last item in the array and print it out
echo -e "Task 4\n"
firstThing=${myArray[0]} #first item in array becomes variable firstThing
myArray[0]=${myArray[-1]} #-1 is end of array. $ unpacks array. Change 1st item to final item.
myArray[-1]=$firstThing
echo -e "This is the array after swapping the first and last items:\n"
echo ${myArray[*]} #Print all of the array with *
read


#Task 5 Print the first 3 and last 3 items in the array
echo -e "Task 5\n"
echo -e "These are the first 3 and last 3 items in the array:\n"
echo ${myArray[*]:0:3} ${myArray[*]: -3} #index 0 to 3, and 3rd to last to last
read
clear


#Task 6 Loop through and print out the individual items in the array
echo -e "Task 6\n"
echo -e "These are the elements of the array:\n"
for i in ${myArray[*]};
do
	echo $i
done
read
clear


#Task 7 Check to see if cat is in my array and let the user know
echo -e "Task 7\n"
catFlag=0
for i in ${!myArray[*]};
do
	if [[ ${myArray[$i]} == "cat" ]]; then
		catFlag=1
		break
	fi
done

if [[ catFlag -eq 1 ]];then
	echo "There is a cat in my array"
else
	echo "There is not a cat in my array"
fi
read
clear


#Task 8 Get the name of a Marvel character from the user and pass it to the
#random insert function
echo -e "Task 8\n"
read -p "Please enter the name of a Marvel character: " userHero
userHero=$( echo $userHero | tr " " "_")
RandoInsert $userHero
echo
read
clear

#Task 9 Print out the index position of the hero then the array
echo -e "Task 9\n"
for i in ${!myArray[*]};
do
	if [[ ${myArray[$i]} == $userHero ]];then
		echo "$userHero is at position $i in the array"
	fi
done
echo
read


#Task 10 Show the final state of the array
echo -e "Task 10\n"
echo "The array is now: ${myArray[*]}"
read
clear

#Task 11 Copy integers to new array, sort, print
echo -e "Task 11\n"
for i in ${!myArray[*]};
do
	if [[ ${myArray[$i]} =~ ^-?[0-9]+$ ]];then
		intArray+=(${myArray[$i]})
	fi
done

intArray=($(
	for i in ${intArray[*]};
	do
		echo $i
	done | sort -n  ))
echo "The integers in the original array, sorted, are: ${intArray[*]}"
read
clear

#Task 12 Create and unpack an array of arrays
echo -e "Task 12\n"
echo -e "These are the elements of the array of arrays\n"
subarray1=(1 2 3)
subarray2=(a b c)
packing_array=('subarray1[*]' 'subarray2[*]') #box of two boxes
my_array=('packing_array[*]')

for i in ${my_array[*]}
do
	for j in ${!i}
	do
		for k in ${!j} #How many things are in the packing array?
		do
			echo $k
		done
	done
done

echo
read -p "Press enter to end the script"
