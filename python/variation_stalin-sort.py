"""Add elements in start to sort the array | Variation of Stalin Sort"""
# Python implementation to sort 
# the array by using the variation 
# of the Stalin sort 

# Function to sort the array 
def variationStalinsort(arr): 
	j = 0
	while True: 
		moved = 0
		for i in range(len(arr) - 1 - j): 
			if arr[i] > arr[i + 1]: 
				arr.insert(moved, arr.pop(i + 1)) 
				moved += 1
		j += 1
		if moved == 0: 
			break
	return arr 

# Driver Code 
if __name__ == "__main__": 
	arr = [2, 1, 4, 3, 6, 5, 8, 7, 10, 9] 
	
	# Function Call 
	print(variationStalinsort(arr)) 
