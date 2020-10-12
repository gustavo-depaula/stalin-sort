class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class Linkedlist:
    def __init__(self):
        self.head = None

    def stalin_sort(self):
        pointer = prev = None
        if self.head:
            pointer = self.head.next
            prev = self.head
        while pointer is not None:
            if pointer.data < prev.data:  # eliminate pointer node
                prev.next = pointer.next

            else:
                prev = pointer
            pointer = pointer.next


    def display_list(self):
        pointer = self.head
        while pointer is not None:
            print(pointer.data, end=' ')
            pointer = pointer.next
        print()

    def append(self, data):
        temp = Node(data)
        if self.head is None:
            self.head = temp
        else:
            pointer = self.head
            while pointer.next is not None:
                pointer = pointer.next
            pointer.next = temp


# create linkedlist
ll = Linkedlist()
ll.append(2)
ll.append(6)
ll.append(8)
ll.append(1)
ll.append(4)
ll.append(9)

# unsorted linkedlist
ll.display_list()

# stalin sort linkedlist
ll.stalin_sort()

# sorted linkedlist
ll.display_list()
