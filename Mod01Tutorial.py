#Caleb Russell
#Tutorial 1

#Task 1
print('\n Task 1 ')
print('Hello World')
input()

#Task 2
print('\n Task 2 ')
user_guess = input('Please enter your guess: ')
print(user_guess)
int(user_guess)

#Task 3
print('\n Task 3 ')
user_guess = int(user_guess)
converted_user_guess = int(user_guess)
print(user_guess * 3)
print(converted_user_guess * 3)
user_guess = str(user_guess)
print(user_guess * 3)
print('I entered ' + user_guess)
#print('I entered ' + converted_user_guess) Throws error

#Task 4
print('\n Task 4 ')
for i in range (1,21,1):#beginning end increment
    if i == 7:
        print('Snowflake')
    elif (i % 2) == 0:
        print('Even')
    else:
        print('Odd')

#Task 5
print('\n Task 5 ')
for i in range (1,int(input('Enter a number greater than 13: '))+1,1):
    if i == 7:
        print('Lucky')
    elif i == 13:
        print('Unlucky')
    elif (i % 2) == 0:
        print('Even')
    else:
        print('Odd')

#Task 6
print('\n Task 6 ')
while True:#True must be capitalized
    last_name = input('Please enter the secret last name: ')
    if last_name == 'Russell':
        break

#Task 7
print('\n Task 7 ')
i = 0
while i < 10:
    print (i)
    i += 1
    
#Task 8
print('\n Task 8 ')
for y in range(0,5,1):
    import random
    x = random.randint(-10,10)
    print(x, end=" ")
print()
print()
print('Press Enter to end the script.')
input()
