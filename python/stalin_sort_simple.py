def StalinSort(list):
    i = 0
    length = len(list)
    if length > 0:
        aux = list[0]
    while i < length and length > 0:
        if aux <= list[i] :
            aux = list[i]
            i = i+1
        else:
            del list[i]
            length = length -1

list = [1,2,3,5,4,6,4,8,9]
StalinSort(list)
print(list)