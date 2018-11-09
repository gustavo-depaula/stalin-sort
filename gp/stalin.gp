stalin(l) =
{
	my(s=List());

	if(#l, listput(s, l[1]));
	for(i=2, #l, if(l[i] >= s[#s], listput(s, l[i])));
	s
};
