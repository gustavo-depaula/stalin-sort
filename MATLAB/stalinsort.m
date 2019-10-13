function [orderedList] = stalinsort(list)

orderedList = [list(1)];current=list(1);
for(i=2:length(list))if(list(i)>current)
	current=list(i);
	orderedList=[orderedList,current];
end end
