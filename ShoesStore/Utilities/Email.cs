using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using Logger;

namespace Utilities
{
    public class Email
    {
        public static string SendGmail(string fromMail, string passFromMail, string mailTo, string subject, string body)
        {
            string msg = "";
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(fromMail);
                mail.To.Add(mailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                //danh cho gmail
                smtp.UseDefaultCredentials = false;
                //...........
                smtp.Credentials = new System.Net.NetworkCredential(fromMail, passFromMail);
                smtp.EnableSsl = true;
                smtp.Send(mail);
                msg = "";
            }
            catch (Exception ex)
            {
                Log.error("SendGmail " + mailTo + " err: " + ex.Message);
            }
            return msg;
        }
        public static string SendMail(string mailTo, string subject, string body, string fromemail, string Port, string Smtp, string frompass)
        {
            string msg = null;
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(fromemail);
                mail.To.Add(mailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = int.Parse(Port);
                smtp.Host = Smtp;
                smtp.Credentials = new System.Net.NetworkCredential(fromemail, frompass);
                smtp.EnableSsl = false;
                smtp.Send(mail);
                msg = "";
            }
            catch (Exception ex)
            {
                Log.error("SendMail " + mailTo + " err: " + ex.Message);
            }
            return msg;
        }
    }
}
