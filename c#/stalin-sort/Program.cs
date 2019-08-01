using System;
using System.Linq;
using System.Collections.Generic;
					
public class Program
{
	public static void Main()
	{
		var array = new int[]{ 1, 2, 4, 3, 6, 8, 0, 8, 9, 5, 7};
		
		Console.WriteLine("{0}", string.Join(", ", StalinSort(array)));
	}
	
	public static IEnumerable<T> StalinSort<T>(IEnumerable<T> items) 
		where T: IComparable<T> 
	{
		if (items.Any()) {
			var comparer = Comparer<T>.Default;
  			T last = items.First();
			foreach (var i in items)
				if (comparer.Compare(i, last) >= 0) {
					last = i;
					yield return i;
				}
		}
	}
}
