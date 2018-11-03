using System;
using System.Linq;
using System.Collections.Generic;


namespace stalin_sort
{
    class Program
    {
        static private int[] stalinSort(int[] array)
        {
        	if (array.Length == 0) return array;//empty array is already sorted. yay!
        	
            var sortedArray = new List<int>() { array[0] }; //resulting array always contains the first element
            
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] >= sortedArray.Last()) 
                	sortedArray.Add(array[i]);
            }
            
            return sortedArray.ToArray();
        } 
        static void Main(string[] args)
        {
            int[] array = new int[]{1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
            
            int[] sortedArray = stalinSort(array);
            
            Console.WriteLine("{0}", string.Join(", ", sortedArray));
        }
    }
}
