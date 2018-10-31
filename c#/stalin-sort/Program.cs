using System;

namespace stalin_sort
{
    class Program
    {
        static int[] stalin_sort(int[] array)
        {
            int[] sortedArray = new int[array.Length];
            sortedArray[0] = array[0];
            
            
            for (int i = 1; i < array.Length; ++i)
            {
                if (array[i] >= sortedArray[i-1])
                {
                    sortedArray[i] = array[i];
                }
            }

            return sortedArray;
        } 
        static void Main(string[] args)
        {
            int[] array = new int[]{1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
            int[] sortedArray = stalin_sort(array);
            
            foreach (var t in sortedArray)
            {
                Console.WriteLine(t);
            }
        }
    }
}