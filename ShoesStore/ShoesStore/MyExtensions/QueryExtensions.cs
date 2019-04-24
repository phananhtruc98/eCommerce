using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions {
        public static IOrderedEnumerable<TSource> OrderByWithDirection<TSource, TKey>
        (this IEnumerable<TSource> source,
            Func<TSource, TKey> keySelector,
            bool descending)
        {
            return descending ? source.OrderByDescending(keySelector)
                : source.OrderBy(keySelector);
        }
        public static IOrderedQueryable<TSource> OrderByWithDirection<TSource, TKey>
        (this IQueryable<TSource> source,
            Expression<Func<TSource, TKey>> keySelector,
            bool descending)
        {
            return descending ? source.OrderByDescending(keySelector)
                : source.OrderBy(keySelector);
        }
        public static IQueryable<T> SortBy<T>(this IQueryable<T> source, string propertyName) {
            if (source == null) {
                throw new ArgumentNullException("source");
            }
            // DataSource control passes the sort parameter with a direction
            // if the direction is descending           
            int descIndex = propertyName.IndexOf(" DESC");
            if (descIndex >= 0) {
                propertyName = propertyName.Substring(0, descIndex).Trim();
            }
            if (String.IsNullOrEmpty(propertyName)) {
                return source;
            }
            ParameterExpression parameter = Expression.Parameter(source.ElementType, String.Empty);
            MemberExpression property = Expression.Property(parameter, propertyName);
            LambdaExpression lambda = Expression.Lambda(property, parameter);
            string methodName = (descIndex < 0) ? "OrderBy" : "OrderByDescending";
            Expression methodCallExpression = Expression.Call(typeof(Queryable), methodName,
                new Type[] { source.ElementType, property.Type },
                source.Expression, Expression.Quote(lambda));
            return source.Provider.CreateQuery<T>(methodCallExpression);
        }
    }
}

