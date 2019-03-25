using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;

namespace Utilities
{
    public class EncryptHelper
    {
        public static string Encrypt(string toEncrypt)
        {
            byte[] keyArray;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            string key = "sayonara";

            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            hashmd5.Clear();

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
            tdes.Clear();
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }
        //tạo mã kích hoạt bằng cách sử dụng hàm random sau đó mã hóa chuỗi random này đi
        public static string RandomCode(int numberCode)
        {
            string activeCode = "";
            Random rd = new Random((int)DateTime.Now.Ticks); ;
            string key = "0123456789";
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < numberCode; i++)
            {
                sb.Append(key.Substring(rd.Next(0, key.Length - 1), 1));
            }
            activeCode = sb.ToString();
            return activeCode;
        }

    }
}
