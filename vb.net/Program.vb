Module Program

    Private Function stalinSort(inputArray As Integer()) As Integer()

        If inputArray.Length = 0 Then Return inputArray
        Dim sortedArray = New List(Of Integer)
        Dim counter As Integer

        sortedArray.Add(inputArray(0))
        For counter = 1 To inputArray.Length - 1
            If inputArray(counter) >= sortedArray.Last Then sortedArray.Add(inputArray(counter))
        Next

        Return sortedArray.ToArray()

    End Function


    Sub Main()

        Dim array = New Integer() {1, 2, 4, 3, 6, 8, 0, 9, 5, 7}
        Dim sortedArray = stalinSort(array)

        Console.WriteLine("{0}", String.Join(", ", sortedArray))
        Console.ReadLine()
    End Sub

End Module
