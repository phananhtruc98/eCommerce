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
            string s = "_____";
            //string[] arr = s.ToCharArray(); 
            for(int i = 0; i< star; i++)
            {

            }
            return s;
        }
    }

    
}