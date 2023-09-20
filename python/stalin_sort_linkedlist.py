from typing import Any, Optional

class Node:
    def __init__(self, data: Any):
        self.data: Any = data
        self.next: Optional[Node] = None


class LinkedList:
    def __init__(self):
        self.head: Optional[Node] = None
        self.tail: Optional[Node] = None # for efficient append

    def stalin_sort(self):
        curr = prev = None
        if not self.head:
            return
        curr = self.head.next
        prev = self.head
        while curr is not None:
            if curr.data < prev.data:  # eliminate "curr" node
                prev.next = curr.next
            else:
                prev = curr
            curr = curr.next
        self.tail = prev

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
            self.tail = temp
        else:
            assert self.tail is not None
            self.tail.next = temp
            self.tail = temp


# create linkedlist
ll = LinkedList()
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
