using System;
using System.IO;

namespace ShoesStore.Paypal
{
    public class PaypalLogger
    {
        public static string LogDirectoryPath = Environment.CurrentDirectory;

        public static void Log(string message)
        {
            try
            {
                var strw = new StreamWriter(LogDirectoryPath + "\\PaypalError.log", true);
                strw.WriteLine("{0}--->{1}", DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"), message);
            }
            catch
            {
            }
        }
    }
}