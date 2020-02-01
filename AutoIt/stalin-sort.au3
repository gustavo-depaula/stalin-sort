#include <Constants.au3>
#include <Array.au3>

Func StalinSort($inputArray)
   Local $iArrayLength = Ubound($inputArray)
   Local $sortedArray[$iArrayLength]
   Local $jCount = 1

   $sortedArray[0] = $inputArray[0]

   For $iCount = 1 To Ubound($inputArray) - 1
	  If $inputArray[$iCount] >= $sortedArray[$jCount-1] Then
		 $sortedArray[$jCount] = $inputArray[$iCount]
		 $jCount = $jCount + 1
	  Else
		 ReDim $sortedArray[UBound($sortedArray)-1]
	  EndIf
   Next
   MsgBox($MB_OK, "Array", _ArrayToString($sortedArray, " "))
   Return $sortedArray
EndFunc

Local $arr[5] = [2,1,5,4,8]
StalinSort($arr);