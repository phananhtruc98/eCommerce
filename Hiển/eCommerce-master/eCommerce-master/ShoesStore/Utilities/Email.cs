using System;
using System.Net;
using System.Net.Mail;
using Logger;

namespace Utilities
{
    public class Email
    {
        public static string SendGmail(string fromMail, string passFromMail, string mailTo, string subject, string body)
        {
            var msg = "";
            try
            {
                var mail = new MailMessage
                {
                    From = new MailAddress(fromMail)
                };
                mail.To.Add(mailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                var smtp = new SmtpClient
                {
                    Port = 587,
                    Host = "smtp.gmail.com",
                    //danh cho gmail
                    UseDefaultCredentials = false,
                    //...........
                    Credentials = new NetworkCredential(fromMail, passFromMail),
                    EnableSsl = true
                };
                smtp.Send(mail);
                msg = "";
            }
            catch (Exception ex)
            {
                Log.error("SendGmail " + mailTo + " err: " + ex.Message);
            }

            return msg;
        }

        public static string SendMail(string mailTo, string subject, string body, string fromemail, string Port,
            string Smtp, string frompass)
        {
            string msg = null;
            try
            {
                var mail = new MailMessage
                {
                    From = new MailAddress(fromemail)
                };
                mail.To.Add(mailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                var smtp = new SmtpClient
                {
                    Port = int.Parse(Port),
                    Host = Smtp,
                    Credentials = new NetworkCredential(fromemail, frompass),
                    EnableSsl = false
                };
                smtp.Send(mail);
                msg = "";
            }
            catch (Exception ex)
            {
                Log.error("SendMail " + mailTo + " err: " + ex.Message);
            }

            return msg;
        }

        public static bool IsValidEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}