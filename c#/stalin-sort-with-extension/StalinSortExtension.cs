using System;
using System.Linq;
using System.Collections.Generic;

namespace StalinSort
{
    static class StalinSortExtension
    {
        public static IOrderedEnumerable<TSource> StalinSortBy<TSource, TKey>(
            this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector)
        {
            return source
                .StalinSort(keySelector, null, false)
                .OrderBy(keySelector);
        }

        public static IOrderedEnumerable<TSource> StalinSortBy<TSource, TKey>(
            this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector,
            IComparer<TKey> comparer)
        {
            return source
                .StalinSort(keySelector, comparer, false)
                .OrderBy(keySelector, comparer);
        }

        public static IOrderedEnumerable<TSource> StalinSortByDescending<TSource, TKey>(
            this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector)
        {
            return source
                .StalinSort(keySelector, null, true)
                .OrderByDescending(keySelector);
        }

        public static IOrderedEnumerable<TSource> StalinSortByDescending<TSource, TKey>(
            this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector,
            IComparer<TKey> comparer)
        {
            return source
                .StalinSort(keySelector, comparer, true)
                .OrderByDescending(keySelector, comparer);
        }

        private static IEnumerable<TSource> StalinSort<TSource, TKey>(
            this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector,
            IComparer<TKey> comparer,
            bool descending)
        {
            using (var iterator = source.GetEnumerator())
            {
                if (iterator.MoveNext())
                {
                    var c = comparer ?? Comparer<TKey>.Default;
                    TKey last = keySelector(iterator.Current);
                    yield return iterator.Current;
                    while (iterator.MoveNext())
                    {
                        TKey current = keySelector(iterator.Current);
                        bool condition = descending ? c.Compare(last, current) >= 0 : c.Compare(last, current) <= 0;
                        if (condition)
                        {
                            last = current;
                            yield return iterator.Current;
                        }
                    }
                }
            }
        }
    }
}