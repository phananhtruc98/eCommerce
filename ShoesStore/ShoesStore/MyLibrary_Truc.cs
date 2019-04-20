using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;

namespace ShoesStore
{
    public partial class MyLibrary
    {
        public static bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static string DrawStar(int star)
        {
            string s = "";
            List<string> list = new List<string>();
            
            for (int i = 0; i< star; i++)
            {
                list.Add("*");
            }
            s = string.Join(Environment.NewLine, list.ToArray());
            return s;
        }
        public static string DisplayImg (List<string> lst)
        {
            string s = "";
            string p = "";
            foreach(string item in lst)
            {
                p = "<img class='img-thumbnail' style='width:50px; height:50px' src= '/images/products/kickz/UltraBoost 19/slides/" + item + "'>";
                s = s + p;
            }
            return s;
        }

    }

    
}