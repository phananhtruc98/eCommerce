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
    }

    
}