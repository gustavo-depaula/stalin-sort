import random

def random_list_maker(length):

    random_list = []
    for i in range(0, length):
        random_list.append(random.randint(0, 100))
    
    return random_list