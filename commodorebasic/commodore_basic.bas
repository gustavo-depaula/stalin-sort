100 input "enter number of elements in array";n
110 if n<1 then goto 330
120 ns=1
130 dim arr$(n)
140 dim brr$(n)
150 biggestidx=1
160 for i=1 to n
170 print "enter value of element #";i;:input arr$(i)
180 next i
190 for i=1 to n
200 if i=1 then goto 240
210 if arr$(i)<arr$(biggestidx) then goto 250
220 biggestidx=i
230 ns=ns+1
240 brr$(ns)=arr$(i)
250 next i
260 print "[ ";
270 for i=1 to ns
280 print brr$(i);
290 if i<>ns then print ", ";
300 next i
310 print " ]"
320 goto 350
330 print "[ ]"
340 goto 350
350 end
run
