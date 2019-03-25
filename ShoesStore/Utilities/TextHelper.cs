using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;
using Logger;
using System.Web;
using System.Net;
using System.Web.UI.WebControls;

namespace Utilities
{
    public class TextHelper
    {
        public static string TrimText(string textTrim, int length)
        {
            if (!String.IsNullOrEmpty(textTrim))
            {
                if (textTrim.Length > length)
                {
                    var arrWord = textTrim.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                    var sb = new StringBuilder();
                    foreach (var word in arrWord)
                    {
                        if ((sb + word).Length > length)
                            return string.Format("{0} ...", sb.ToString().TrimEnd(' '));
                        sb.Append(word + " ");
                    }
                }
            }
            return textTrim;
        }

        public static string DateText(string text)
        {
            string day = DateTime.Parse(text).ToString("ddd");
            string buoi = DateTime.Parse(text).ToString("tt");
            int ngay = Convert.ToInt32(DateTime.Parse(text).ToString("dd"));
            int thang = Convert.ToInt32(DateTime.Parse(text).ToString("MM"));
            int nam = Convert.ToInt32(DateTime.Parse(text).ToString("yyyy"));
            int gio = Convert.ToInt32(DateTime.Parse(text).ToString("hh"));
            int phut = Convert.ToInt32(DateTime.Parse(text).ToString("mm"));
            string buoix = DateTime.Now.ToString("tt");
            int ngayx = Convert.ToInt32(DateTime.Now.ToString("dd"));
            int thangx = Convert.ToInt32(DateTime.Now.ToString("MM"));
            int namx = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            int giox = Convert.ToInt32(DateTime.Now.ToString("hh"));
            int phutx = Convert.ToInt32(DateTime.Now.ToString("mm"));

            if (buoix == "PM")
            {
                giox = giox + 12;
            }
            if (buoi == "AM")
            {
                buoi = " sáng";
            }
            else
            {
                buoi = " chiều";
                gio = gio + 12;
            }

            if (nam == namx)
            {
                if (thang == thangx)
                {
                    if (ngay == ngayx)
                    {
                        if (gio == giox)
                        {
                            text = (phutx - phut).ToString() + " phút trước";
                        }
                        else
                        {
                            text = (giox - gio).ToString() + " giờ trước";
                        }
                    }
                    else
                    {
                        if (ngayx - ngay == 1)
                        {
                            text = "Hôm qua lúc " + gio + "h" + phut + buoi;
                        }
                        else if (ngayx - ngay == 2)
                        {
                            text = "Hôm kia lúc " + gio + "h" + phut + buoi;
                        }
                        else
                        {
                            text = ngayx - ngay + " ngày trước lúc " + gio + "h" + phut + buoi;
                        }
                    }
                }
                else if (thangx - thang == 1)
                {
                    text = "Tháng trước";
                }
                else if (thangx - thang == 2)
                {
                    text = "2 tháng trước";
                }
                else
                {
                    if (day == "Mon")
                    {
                        text = "Thứ hai " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Tue")
                    {
                        text = "Thứ ba " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Wes")
                    {
                        text = "Thứ tư " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Thu")
                    {
                        text = "Thứ năm " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Fri")
                    {
                        text = "Thứ sáu " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Sat")
                    {
                        text = "Thứ bảy " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                    else if (day == "Sun")
                    {
                        text = "Chủ nhật " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
                    }
                }
            }
            else if (namx - nam == 1)
            {
                text = DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
            }
            else
            {
                text = (namx - nam).ToString() + " năm trước";
            }
            return text;
        }
        public static string getBuyCode(string num)
        {
            if (HttpContext.Current.Request.Cookies["cart"] != null)
                return HttpContext.Current.Request.Cookies["cart"].Values["buycode"].ToString();
            else
            {
                string val = "";
                string codes = "FANY" + num + "Y" + DateTime.Now.ToString("yyyy") + "M" + DateTime.Now.ToString("MM") + "D" + DateTime.Now.ToString("dd") + "AT" + DateTime.Now.ToString("HHmmss");
                HttpContext.Current.Response.Cookies["cart"].Expires = DateTime.Now.AddDays(-1);
                HttpCookie cookieLang = new HttpCookie("cart");
                cookieLang.Values.Add("buycode", codes);
                cookieLang.Expires = DateTime.Now.AddDays(1);
                HttpContext.Current.Response.SetCookie(cookieLang);
                return val;
            }
        }
        public static string ShortDateText(string text)
        {
            string day = DateTime.Parse(text).ToString("ddd");
            string buoi = DateTime.Parse(text).ToString("tt");
            int ngay = Convert.ToInt32(DateTime.Parse(text).ToString("dd"));
            int thang = Convert.ToInt32(DateTime.Parse(text).ToString("MM"));
            int nam = Convert.ToInt32(DateTime.Parse(text).ToString("yyyy"));
            int gio = Convert.ToInt32(DateTime.Parse(text).ToString("hh"));
            int phut = Convert.ToInt32(DateTime.Parse(text).ToString("mm"));
            string buoix = DateTime.Now.ToString("tt");
            int ngayx = Convert.ToInt32(DateTime.Now.ToString("dd"));
            int thangx = Convert.ToInt32(DateTime.Now.ToString("MM"));
            int namx = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
            int giox = Convert.ToInt32(DateTime.Now.ToString("hh"));
            int phutx = Convert.ToInt32(DateTime.Now.ToString("mm"));

            if (buoix == "PM")
            {
                giox = giox + 12;
            }
            if (buoi == "AM")
            {
                buoi = " sáng";
            }
            else
            {
                buoi = " chiều";
                gio = gio + 12;
            }

            if (nam == namx)
            {
                if (thang == thangx)
                {
                    if (ngay == ngayx)
                    {
                        if (gio == giox)
                        {
                            text = (phutx - phut).ToString() + " phút trước";
                        }
                        else
                        {
                            text = (giox - gio).ToString() + " giờ trước";
                        }
                    }
                    else
                    {
                        if (ngayx - ngay == 1)
                        {
                            text = "Hôm qua";
                        }
                        else if (ngayx - ngay == 2)
                        {
                            text = "Hôm kia";
                        }
                        else
                        {
                            text = ngayx - ngay + " ngày trước";
                        }
                    }
                }
                else if (thangx - thang == 1)
                {
                    text = "Tháng trước";
                }
                else if (thangx - thang == 2)
                {
                    text = "2 tháng trước";
                }
                else
                {
                    if (day == "Mon")
                    {
                        text = "T.hai " + DateTime.Parse(text).ToString("dd-MM-yyyy");
                    }
                    else if (day == "Tue")
                    {
                        text = "T.ba " + DateTime.Parse(text).ToString("dd-MM-yyyy");
                    }
                    else if (day == "Wes")
                    {
                        text = "T.tư " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm");
                    }
                    else if (day == "Thu")
                    {
                        text = "T.năm " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm");
                    }
                    else if (day == "Fri")
                    {
                        text = "T.sáu " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm");
                    }
                    else if (day == "Sat")
                    {
                        text = "T.bảy " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm");
                    }
                    else if (day == "Sun")
                    {
                        text = "C.nhật " + DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm");
                    }
                }
            }
            else if (namx - nam == 1)
            {
                text = DateTime.Parse(text).ToString("dd-MM-yyyy hh:mm") + buoi;
            }
            else
            {
                text = (namx - nam).ToString() + " năm trước";
            }
            return text;
        }
        public static string getRoot()
        { 
            return HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
        }
        public static void loadMeta(HtmlHead headTag, string title, string description, string keyws, string category, string url, string img, string dateup, string datemf, string datecre)
        {
            headTag.Title = title;
            HtmlMeta PagemetaTag = new HtmlMeta();
            PagemetaTag.Name = "Description";
            PagemetaTag.Content = description;
            headTag.Controls.Add(PagemetaTag);
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Name = "Keywords";
            PagemetaTag.Content = keyws;
            headTag.Controls.Add(PagemetaTag);
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("property", "og:url");
            PagemetaTag.Attributes.Add("itemprop", "url");
            PagemetaTag.Content = url;
            headTag.Controls.Add(PagemetaTag);
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("property", "og:image");
            PagemetaTag.Attributes.Add("itemprop", "thumbnailUrl");
            PagemetaTag.Content = img;
            headTag.Controls.Add(PagemetaTag);
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("property", "og:title");
            PagemetaTag.Attributes.Add("itemprop", "headline");
            PagemetaTag.Content = title;
            headTag.Controls.Add(PagemetaTag);

            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("itemprop", "articleSection");
            PagemetaTag.Content = category;
            headTag.Controls.Add(PagemetaTag);

            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("itemprop", "sourceOrganization");
            PagemetaTag.Attributes.Add("name", "source");
            PagemetaTag.Content = TextHelper.getRoot();
            headTag.Controls.Add(PagemetaTag);

            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("itemprop", "dateCreated");
            PagemetaTag.Content = DateTime.Parse(datecre).ToString("yyyy-MM-dd HH:mm + 07:00");
            headTag.Controls.Add(PagemetaTag);
            string editdate = datemf;
            if (editdate == "")
                editdate = datecre;
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("itemprop", "dateModified");
            PagemetaTag.Attributes.Add("name", "lastmod");
            PagemetaTag.Content = DateTime.Parse(editdate).ToString("yyyy-MM-dd HH:mm + 07:00");
            headTag.Controls.Add(PagemetaTag);
            string upddate = dateup;
            if (upddate == "")
                upddate = datecre;
            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("itemprop", "datePublished");
            PagemetaTag.Attributes.Add("name", "pubdate");
            PagemetaTag.Content = DateTime.Parse(upddate).ToString("yyyy-MM-dd HH:mm + 07:00");
            headTag.Controls.Add(PagemetaTag);

            PagemetaTag = new HtmlMeta();
            PagemetaTag.Attributes.Add("property", "og:type");
            PagemetaTag.Content = "article";
            headTag.Controls.Add(PagemetaTag);
            PagemetaTag = new HtmlMeta();

            PagemetaTag.Attributes.Add("property", "og:site_name");
            PagemetaTag.Content = "Botyenmachtphcm.com";
            headTag.Controls.Add(PagemetaTag);

            PagemetaTag.Attributes.Add("property", "og:description");
            PagemetaTag.Attributes.Add("itemprop", "description");
            PagemetaTag.Content = description;
            headTag.Controls.Add(PagemetaTag);
        }
        public static void MoveSelectedValue(ListBox lbScr, ListBox lbDest)
        {
            foreach (ListItem listItem1 in lbScr.Items)
            {
                if (listItem1.Selected)
                    lbDest.Items.Add(listItem1);
            }
            for (int i = lbScr.Items.Count - 1; i >= 0; i--)
            {
                if (lbScr.Items[i].Selected)
                    lbScr.Items.RemoveAt(i);
            }
            foreach (ListItem listItem2 in lbDest.Items)
            {
                if (listItem2.Selected)
                    listItem2.Selected = false;
            }
        }
        public static string getIPAddress()
        {
            string val = "";
            try
            {
                val = (new WebClient()).DownloadString("http://checkip.dyndns.org/");
                val = (new Regex(@"\d{1,3}\.\d{1,3}.\d{1,3}.\d{1,3}")).Matches(val)[0].ToString();
            }
            catch (Exception)
            {
                val = HttpContext.Current.Request.UserHostAddress;
            }
            return val;

        }
        public static string ConvertToUnSign(string text)
        {
            if (text.Trim() != "" || text != null)
            {
                text = text.Replace("'", "");
                text = text.Replace(".", "");
                for (int i = 32; i < 48; i++)
                {
                    text = text.Replace(((char)i).ToString(), " ");
                }
                text = text.Trim();
                text = text.Replace(" ", "-");
                text = text.Replace(",", "-");
                text = text.Replace(";", "-");
                text = text.Replace(":", "-");
                text = text.Replace("/", "-");
                text = text.Replace("%", "-");
                text = text.Replace("?", "");
                text = text.Replace("!", "");
                text = text.Replace("---", "-");
                text = text.Replace("--", "-");
                text = text.Replace("_", "-");

                Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
                string strFormD = text.Normalize(System.Text.NormalizationForm.FormD);
                return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
            }
            else
            {
                return "";
            }
        }
        public static string ConvertUnSign(string text)
        {
            if (text.Trim() != "" || text != null)
            {
                Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
                string strFormD = text.Normalize(System.Text.NormalizationForm.FormD).Replace("  ", " ").Replace("&", "").Replace(".","");
                return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
            }
            else
            {
                return "";
            }
        }
        public static string ConvertText(string text)
        {
            text = text.Replace("'", "");
            text = text.Replace("(", "[");
            text = text.Replace(")", "]");
            text = text.Replace(" OR ", "");
            text = text.Replace(" AND ", "");
            text = text.Replace("--", "");
            text = text.Replace("drop", "");
            text = text.Replace("select", "");
            text = text.Replace("delete", "");
            text = text.Replace("infomation_schema", "");
            text = text.Replace("insert into", "");
            text = text.Replace("update set", "");
            text = text.Replace("from", "");
            text = text.Replace("union", "");
            text = text.Replace("xp_", "");
            text = text.Replace("where", "");
            text = text.Replace("field name", "");
            return text;
        }
        public static string ConvertLongMoney(string text)
        {
            text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", decimal.Parse(text));
            return text;
        }
        public static string ConvertMoney(string text)
        {
            if (text.Length == 11)
            {
                text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", float.Parse(text)).Substring(0, 6);
            }
            if (text.Length == 10)
            {
                text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", float.Parse(text)).Substring(0, 5);
            }
            if (text.Length == 9)
            {
                text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", float.Parse(text)).Substring(0, 3);
            }
            if (text.Length == 8)
            {
                text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", float.Parse(text)).Substring(0, 2);
            }
            if (text.Length == 7)
            {
                text = string.Format(System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN"), "{0:#,##}", float.Parse(text)).Substring(0, 1);
            }
            return text;
        }
        public static string getImage_ChangeFileName(string SavePath, string ExtraName, HttpPostedFile imgAdv)
        {
            string StrFileName = "";
            try
            {
                Thumbnail th = new Thumbnail();
                string RootPath = HttpContext.Current.Request.PhysicalApplicationPath + SavePath;
                if (imgAdv != null && imgAdv.FileName.Length != 0) //Checking for valid file
                {
                    // Since the PostedFile.FileNameFileName gives the entire path we use Substring function to rip of the filename alone.
                    string StrFileNameType = imgAdv.FileName.Substring(imgAdv.FileName.LastIndexOf(".") + 1);
                    StrFileName = "ewebvietnam-hcm-" + ExtraName + "-" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + "." + StrFileNameType;
                    int IntFileSize = imgAdv.ContentLength;
                    if (IntFileSize <= 0 || IntFileSize > 3145728)
                    {
                        return StrFileName;
                    } //error.Text = "upload failed";
                    else
                    {
                        imgAdv.SaveAs(RootPath + "\\" + StrFileName);
                        return StrFileName;
                    }
                }
                else
                {
                    return StrFileName;
                }



            }
            catch (Exception ex)
            {
                Log.info("getImage err " + ex.Message);
                return StrFileName;
            }
        }
    }
}
