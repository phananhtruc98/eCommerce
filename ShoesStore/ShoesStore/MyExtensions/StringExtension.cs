﻿using System;
using System.Text;
using System.Text.RegularExpressions;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static string UnSign(this string s)
        {
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string temp = s.Normalize(NormalizationForm.FormD);
            return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }
        public static bool ContainsEx(this string source, string value/*, StringComparison comparison*/)
        {
            if (string.IsNullOrWhiteSpace(source))
            {
                return false;
            }

            return source.UnSign().IndexOf(value, StringComparison.OrdinalIgnoreCase) >= 0;
        }
    }
}