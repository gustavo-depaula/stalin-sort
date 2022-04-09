100 input "enter number of elements in array";n:dim arr$(n)
110 ns=1
120 dim brr$(n)
130 biggestidx=1
140 for i=1 to n
150 print "enter value of element #";i;:input arr$(i)
160 next i
170 for i=1 to n
180 if i=1 then goto 220
190 if arr$(i)<arr$(biggestidx) then goto 230
200 biggestidx=i
210 ns=ns+1
220 brr$(ns)=arr$(i)
230 next i
240 print "[ ";
250 for i=1 to ns
260 print brr$(i);
270 if i<>ns then print ", ";
280 next i
290 print " ]"
300 end
run
