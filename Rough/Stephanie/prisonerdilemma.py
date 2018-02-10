from random import randint


number_of_games = 5

# 0 for confess and 1 for deny
my_ans = []
comp_ans = []

# store result as
# 0 = both confess
# 1 = both deny
# 2 = I confess and computer deny
# 3 = I deny and computer confess
result = []

def game():
    comp_choice = randint(0,1)
    print('\nFor confess:0 , For deny:1')

    while True:
        my_choice = input('my choice(0 or 1): ')
        my_choice = int(my_choice)
        if my_choice == 0 or my_choice == 1:
            break
        print('Try again!!!')

    print('Computer choice: {}'.format(comp_choice))
    my_ans.append(my_choice)
    comp_ans.append(comp_choice)

    ans = 0

    if my_choice == comp_choice:
        if my_choice == 0:
            ans = 0
            print('Both --> six years each')
        else:
            ans = 1
            print('Both --> go free')
    elif my_choice != comp_choice:
        if my_choice == 0:
            ans = 2
            print('I --> three years')
            print('Partner --> ten years')
        else:
            ans = 3
            print('I --> ten years')
            print('Partner --> three years')

    result.append(ans)

    print('Result: {}'.format(ans))



for x in range(0,number_of_games):
    game()

print('\nSummary of Games\n')
print('My choices: {}'.format(my_ans))
print('Computer choices: {}'.format(comp_ans))
print('Result: {}'.format(result))
