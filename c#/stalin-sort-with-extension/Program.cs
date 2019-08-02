using System;
using System.Linq;
using System.Collections.Generic;

namespace StalinSort
{
    public class Program
    {
        public static void Main()
        {
            var list = new List<int>() { 6, 8, 5, 9, 11, 12, 4, 2, 7, 9 };
            foreach (var e in list.StalinSortBy(x => x))
            {
                Console.WriteLine(e);
            }
            Console.WriteLine();
            /* 
             * output:
             * 1
             * 2
             * 4
             * 4
             * 9
             */

            var fruits = new List<Fruit>(){
                new Fruit{ Name = "Orange", Price = 80 },
                new Fruit{ Name = "Peach", Price = 150 },
                new Fruit{ Name = "Banana", Price = 50 },
                new Fruit{ Name = "Grape", Price = 250 },
                new Fruit{ Name = "Strawberry", Price = 20 },
                new Fruit{ Name = "Melon", Price = 2000 },
            };

            foreach (var e in fruits.StalinSortBy(x => x.Name.Length).ThenBy(x => x.Price))
            {
                Console.WriteLine($"Name:{e.Name} Price:{e.Price}");
            }
            /*
             *output:
             *Name:Banana Price:50
             *Name:Orange Price:80
             *Name:Strawberry Price:20
             */
            Console.ReadLine();
        }
    }

    public class Fruit
    {
        public string Name;
        public int Price;
    }
}