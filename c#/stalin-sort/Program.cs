using System;

namespace stalin_sort
{
    class Program
    {
        static int[] stalin_sort(int[] array)
        {
            int position = 1;
            int counter = 0;
            
            for (int i = 0; i < array.Length - 1; i++)
            {
                if (array[i + 1] >= array[i]) counter++;
            }
            
            int[] sortedArray = new int[counter];
            sortedArray[0] = array[0];
            
            
            for (int i = 1; i < array.Length; ++i)
            {
                if (array[i] >= sortedArray[position - 1])
                {
                    sortedArray[position] = array[i];
                    position++;
                }
            }

            return sortedArray;
        } 
        static void Main(string[] args)
        {
            int[] array = new int[]{1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
            int[] sortedArray = stalin_sort(array);
            
            for (int i = 0; i < sortedArray.Length; i++)
            {
                if (i == sortedArray.Length - 1) Console.WriteLine("{0}", sortedArray[i]);
                else Console.Write("{0}, ", sortedArray[i]);
            }
        }
    }
}
