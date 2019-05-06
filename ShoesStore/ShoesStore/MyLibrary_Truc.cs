using ShoesStore.DataAccessLogicLayer;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore
{
    public partial class MyLibrary
    {
      
        public static bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string DrawStar(int star)
        {
            var sb = new StringBuilder();
            sb.Append(" <div class='rating__body'>");
            for (var i = 1; i <= 5; i++)
            {
                var hasStar = i <= star ? "rating__star--active" : "";
                sb.Append($@"<svg
class='rating__star {hasStar}'
width='13px' height='12px'>
<g class='rating__fill'>
<use
href='/images/sprite.svg#star-normal'>
</use>
</g>
<g class='rating__stroke'>
<use
href='/images/sprite.svg#star-normal-stroke'>
</use>
</g>
</svg>
<div
class='rating__star rating__star--only-edge rating__star--active'>
<div class='rating__fill'>
<div class='fake-svg-icon'></div>
</div>
<div class='rating__stroke'>
<div class='fake-svg-icon'></div>
</div>
</div>");
            }

            sb.Append("</div>");
            //string s = "";
            //List<string> list = new List<string>();
            //for (int i = 0; i < star; i++)
            //{
            //list.Add("*");
            //}
            //s = string.Join(Environment.NewLine, list.ToArray());
            //return s;
            return sb.ToString();
        }

        public static string DisplayImg(List<string> lst)
        {
            var s = "";
            var p = "";
            foreach (var item in lst)
            {
                p =
                    "<img class='img-thumbnail' style='width:50px; height:50px' src= '/images/products/kickz/UltraBoost 19/slides/" +
                    item + "'>";
                s = s + p;
            }

            return s;
        }
   
        public static string  AlertShp(Shp shp,int year)
        {
            string s = "";
            if(Shp_Bus.CountRcptBuySuccess(shp,year) < 3)
            {
                s = "<span class='alert alert-danger' role='alert'>Nguy hiểm</span>";
            }
            return s;
        }

        public static string AlertShp(Shp shp,int month, int year)
        {
            string s = "";
            if (Shp_Bus.CountRcptBuySuccess(shp,month,year) < 3)
            {
                s = "<span class='alert alert-danger' role='alert'>Nguy hiểm</span>";
            }
            return s;
        }
        //public static string uploadAvaAdmin(FileUpload file)
        //{
        //    var fname = file.FileName;
        //    var fpath = Server.MapPath("/Admin/Images/avatar/");
        //    fpath = fpath + @"/" + file.FileName;
        //    var getext = Path.GetExtension(file.PostedFile.FileName);
        //    var filename = Path.GetFileNameWithoutExtension(file.PostedFile.FileName);
        //    var strFilePath = filename + getext;
        //    if (getext != ".JPEG" && getext != ".jpeg" && getext != ".JPG" && getext != ".jpg" &&
        //        getext != ".png" && getext != ".tif" && getext != ".tiff")
        //    {
        //        MyLibrary.Show("Chọn ảnh không đúng!");
        //        return;
        //    }

        //    file.SaveAs(Server.MapPath(@"~/Admin/Images/avatar/" + strFilePath));
        //    ViewState["fname"] = fname;
        //    ViewState["fPath"] = @"~/Admin/Images/avatar/" + strFilePath;
        //    return strFilePath;
        //}
    }
}