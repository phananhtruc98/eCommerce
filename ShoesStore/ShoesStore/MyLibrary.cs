using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Mail;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using Utilities;

namespace ShoesStore
{
    public partial class MyLibrary : Page
    {
        private static readonly string MoneyPrefix = "";
        private static readonly string proPath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/products";
        private static readonly string proCatPath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/categories";
        private static readonly string proDetUrl = "/san-pham/";
        private static readonly string slidePath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/slides";
        private static readonly string cusPath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/usrs/cus";
        private static readonly string merPath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/usrs/mer";
        private static readonly string usrPath = System.Web.HttpContext.Current.Server.MapPath("~") + "images/usrs";
        private static readonly string _noImg = System.Web.HttpContext.Current.Server.MapPath("~") +   "images/no_img.png";
        private static readonly string _noAvatar = System.Web.HttpContext.Current.Server.MapPath("~") + "images/avatar/no_img.jpg";
        private static readonly string adminPath = System.Web.HttpContext.Current.Server.MapPath("~") + "admin/images/avatar";
        public static string LogDirectoryPath = Environment.CurrentDirectory;

        public static SortDirection SortDirection
        {
            get
            {
                if (GetCurrentPageViewState()["SortDirection"] == null)
                    GetCurrentPageViewState()["SortDirection"] = SortDirection.Ascending;
                return (SortDirection) GetCurrentPageViewState()["SortDirection"];
            }
            set => GetCurrentPageViewState()["SortDirection"] = value;
        }

        public static CartDet_BUS CartDet_BUS => new CartDet_BUS();
        public static ProSize_BUS ProSize_BUS => new ProSize_BUS();
        public static ProDet_BUS ProDet_BUS => new ProDet_BUS();
        public static ProCat_BUS ProCat_BUS => new ProCat_BUS();
        public static ProSlide_BUS ProSlide_BUS => new ProSlide_BUS();
        public static ProBrand_BUS ProBrand_BUS => new ProBrand_BUS();
        public static Usr_BUS Usr_BUS => new Usr_BUS();
        public static Cus_BUS Cus_BUS => new Cus_BUS();
        public static Mer_BUS Mer_BUS => new Mer_BUS();
        public static WebInfo_BUS WebInfo_BUS => new WebInfo_BUS();

        /// <summary>
        ///     Return <c>WebSlide_BUS</c>
        /// </summary>
        public static WebSlide_BUS WebSlide_BUS => new WebSlide_BUS();

        public static Mstr_BUS Mstr_BUS => new Mstr_BUS();

        public static Sub_BUS Sub_BUS => new Sub_BUS();
        public static Pro_BUS Pro_BUS => new Pro_BUS();
        public static RcptBuyDet_BUS RcptBuyDet_BUS => new RcptBuyDet_BUS();
        public static Cart_BUS Cart_BUS => new Cart_BUS();
        public static Shp_BUS Shp_Bus => new Shp_BUS();
        public static Rcpt_BUS Rcpt_BUS => new Rcpt_BUS();
        public static RcptBuy_BUS RcptBuy_BUS => new RcptBuy_BUS();
        public static RcptBuySta_BUS RcptBuySta_BUS => new RcptBuySta_BUS();
        public static RcptBuyStaDet_BUS RcptBuyStaDet_BUS => new RcptBuyStaDet_BUS();
        public static RcptBuyStaStep_BUS RcptBuyStaStep_BUS => new RcptBuyStaStep_BUS();
        public static RcptSub_BUS RcptSub_BUS => new RcptSub_BUS();
        public static RcptSubDet_BUS RcptSubDet_BUS => new RcptSubDet_BUS();
        public static ProColor_BUS ProColor_BUS => new ProColor_BUS();

        public static string AdminImgPath(object iMstr)
        {
            var mstr = (Mstr) iMstr;

            try
            {
                string[] path =
                {
                    adminPath,
                    mstr.Usr.Avatar
                };
                return ReturnUrl(path);
            }
            catch
            {
                return _noAvatar;
            }
        }

        public static string CusImgPath(object iCus)
        {
            var cus = (Cus) iCus;
            if (string.IsNullOrEmpty(cus.Usr.Avatar))
                return Path.Combine(usrPath, "default.jpg");
            return Path.Combine(cusPath, cus.CusId.ToString(), cus.Usr.Avatar);
        }

        public static string CusInfoUrl(Cus cus)
        {
            return $"/thong-tin-nguoi-dung/{cus.Usr.Login}";
        }

        public static void ExposeProperty<T>(Expression<Func<T>> property)
        {
            var expression = GetMemberInfo(property);
            var path = string.Concat(expression.Member.DeclaringType.FullName,
                ".", expression.Member.Name);
            // Do ExposeProperty work here...
        }

        public static string FormatProdetColor(ProDet proDet)
        {
            return
                $"<div style = 'background-color: #{proDet.ProColor.HexCode}; height: 32px; width: 32px; border: black solid 1px; display: inline-block; float: right' />'";
        }

        public static int[] GetAllowCommentStepIds()
        {
            return new[] {7, 8, 9, 10, 11};
        }

        public static StateBag GetCurrentPageViewState()
        {
            var page = HttpContext.Current.Handler as Page;
            var viewStateProp = page?.GetType().GetProperty("ViewState",
                BindingFlags.FlattenHierarchy |
                BindingFlags.Instance |
                BindingFlags.NonPublic);
            return (StateBag) viewStateProp?.GetValue(page);
        }

        private static MemberExpression GetMemberInfo(Expression method)
        {
            var lambda = method as LambdaExpression;
            if (lambda == null)
                throw new ArgumentNullException("method");

            MemberExpression memberExpr = null;

            if (lambda.Body.NodeType == ExpressionType.Convert)
                memberExpr =
                    ((UnaryExpression) lambda.Body).Operand as MemberExpression;
            else if (lambda.Body.NodeType == ExpressionType.MemberAccess) memberExpr = lambda.Body as MemberExpression;

            if (memberExpr == null)
                throw new ArgumentException("method");

            return memberExpr;
        }

        public static string GetPriceFormat(object orginPrice, object discountPrice)
        {
            return
                $"<span class='widget-products__new-price'>{double.Parse(discountPrice + "").ToFormatMoney()}</span> <span class='widget-products__old-price'>{orginPrice.ToFormatMoney()}</span>";
        }

        public static Dictionary<string, string> GetProperties(object obj)
        {
            var props = new Dictionary<string, string>();
            if (obj == null)
                return props;

            var type = obj.GetType();
            foreach (var prop in type.GetProperties())
            {
                var val = prop.GetValue(obj, new object[] { });
                var valStr = val == null ? "" : val.ToString();
                props.Add(prop.Name, valStr);
            }

            return props;
        }

        public static object GetPropValue(object src, string propName)
        {
            return src.GetType().GetProperty(propName).GetValue(src, null);
        }

        public static string GetSortDirection()
        {
            string direction;
            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = " DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = " ASC";
            }

            return direction;
        }

        public static void Log(string message)
        {
            try
            {
                var strw = new StreamWriter(Environment.CurrentDirectory + "\\ShoesStore.log", true);
                strw.WriteLine("{0}--->{1}", DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"), message);
            }
            catch
            {
            }
        }

        public static string MerImgPath(object iMer)
        {
            var mer = (Mer) iMer;
            if (string.IsNullOrEmpty(mer.Usr.Avatar))
                return Path.Combine(merPath, "default.jpg");
            return Path.Combine(merPath, mer.MerId.ToString(), mer.Usr.Avatar);
        }

        /// <summary>
        ///     <c>Trả về</c> đường dẫn IMG của ProCat
        /// </summary>
        /// <param name="iProCat">Đối tượng thuộc lớp ProCat</param>
        /// <returns>Trả về đường dẫn IMG của ProCat</returns>
        public static string ProCatImgPath(object iProCat)
        {
            var proCat = (ProCat) iProCat;
            string[] path =
            {
                proCatPath,
                proCat.Img
            };
            return ReturnUrl(path);
        }

        public static string ProColorPath(object iProDet)
        {
            var proDet = (ProDet) iProDet;
            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "color", proDet.ProColor.ColorImg);
        }

        public static string ProDetUrl(object ipro)
        {
            var pro = (Pro) ipro;
            return Path.Combine(proDetUrl, TextHelper.UrlFriendly(pro.ProCat.CatName),
                TextHelper.UrlFriendly(pro.ProName), TextHelper.UrlFriendly(pro.Shp.ShpName));
        }

        public static string ProImgPath(object ipro)
        {
            var pro = (Pro) ipro;
            var re = "";
            //if (string.IsNullOrEmpty(pro.Img))
            //return Path.Combine(proPath, "default.png");

            string[] path =
            {
                proPath,
                pro.Shp.ShpName,
                pro.ProName,
                pro.Img
            };
            re = ReturnUrl(path);

            if (re == _noImg) SaveProImgPath(ipro, "");
            return re;
        }

        public string PropertiesToString()
        {
            PropertyInfo[] _propertyInfos = null;

            if (_propertyInfos == null)
                _propertyInfos = GetType().GetProperties();

            var sb = new StringBuilder();

            foreach (var info in _propertyInfos)
            {
                var value = info.GetValue(this, null) ?? "(null)";
                sb.AppendLine(info.Name + ": " + value);
            }

            return sb.ToString();
        }

        public static string ProSizePath(object iProDet)
        {
            var proDet = (ProDet) iProDet;
            return Path.Combine(proPath, proDet.Pro.Shp.ShpName, proDet.Pro.ProName, "size", proDet.ProSize.SizeImg);
        }

        public static string ProSlidePath(object iProSlide)
        {
            var proSlide = (ProSlide) iProSlide;
            return Path.Combine(proPath, proSlide.Pro.Shp.ShpName, proSlide.Pro.ProName, "Slides", proSlide.Img);
        }

        private static string ReturnUrl(string[] iPath)
        {
            var path = string.Join(@"\", iPath);
            var fullFilePath = Path.Combine(
                HttpContext.Current.Server.MapPath("~")
                    .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1));
            if (File.Exists(fullFilePath))
                return path;

            return _noImg;
        }

        public static void SaveProImgPath(object ipro, FileUpload fileUpload)
        {
            try
            {
                var pro = (Pro) ipro;
                //if (string.IsNullOrEmpty(pro.Img))
                //return Path.Combine(proPath, "default.png");
                string[] arrayPath =
                {
                    proPath,
                    pro.Shp.ShpName,
                    pro.ProName,
                    pro.Img
                };
                var path = string.Join(@"\", arrayPath);
                var proImgPath = Path.Combine(
                    HttpContext.Current.Server.MapPath("~")
                        .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1));

                var proImgPathOnly = Path.GetDirectoryName(proImgPath);

                if (proImgPath != _noImg)
                {
                    //bool exists = Directory.Exists(HostingEnvironment.MapPath(proImgPathOnly));
                    var exists = Directory.Exists(proImgPathOnly);
                    if (!exists)
                        //Directory.CreateDirectory(HostingEnvironment.MapPath(proImgPathOnly));
                        Directory.CreateDirectory(proImgPathOnly);
                }

                if (!string.IsNullOrEmpty(fileUpload.FileName))
                {
                    var fileName = Path.Combine(proImgPathOnly, fileUpload.FileName);
                    fileUpload.SaveAs(fileName);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public static void SaveProImgPath(object ipro, string imgPath)
        {
            try
            {
                var pro = (Pro) ipro;
                //if (string.IsNullOrEmpty(pro.Img))
                //return Path.Combine(proPath, "default.png");
                string[] arrayPath =
                {
                    proPath,
                    pro.Shp.ShpName,
                    pro.ProName,
                    pro.Img
                };
                var path = string.Join(@"\", arrayPath);
                var proImgPath = Path.Combine(
                    HttpContext.Current.Server.MapPath("~")
                        .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1));

                var proImgPathOnly = Path.GetDirectoryName(proImgPath);

                if (proImgPath != _noImg)
                {
                    //bool exists = Directory.Exists(HostingEnvironment.MapPath(proImgPathOnly));
                    var exists = Directory.Exists(proImgPathOnly);
                    if (!exists)
                        //Directory.CreateDirectory(HostingEnvironment.MapPath(proImgPathOnly));
                        Directory.CreateDirectory(proImgPathOnly);
                }

                if (!string.IsNullOrEmpty(imgPath))
                    File.Copy(imgPath, proImgPathOnly);
            }
            catch (Exception ex)
            {
            }
        }

        public static void SaveProImgSlidePath(object ipro, string imgSlidePath)
        {
            try
            {
                var pro = (Pro) ipro;
                //if (string.IsNullOrEmpty(pro.Img))
                //return Path.Combine(proPath, "default.png");


                string[] arrayPath =
                {
                    proPath,
                    pro.Shp.ShpName,
                    pro.ProName,
                    "Slides",
                    Path.GetFileName(imgSlidePath)
                };
                var path = string.Join(@"\", arrayPath);
                var proImgPath = Path.Combine(
                    HttpContext.Current.Server.MapPath("~")
                        .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1));

                var proImgPathOnly = Path.GetDirectoryName(proImgPath);

                if (proImgPath != _noImg)
                {
                    //bool exists = Directory.Exists(HostingEnvironment.MapPath(proImgPathOnly));
                    var exists = Directory.Exists(proImgPathOnly);
                    if (!exists)
                        //Directory.CreateDirectory(HostingEnvironment.MapPath(proImgPathOnly));
                        Directory.CreateDirectory(proImgPathOnly);
                }

                if (!string.IsNullOrEmpty(imgSlidePath))
                    File.Copy(imgSlidePath, proImgPathOnly);
            }


            catch (Exception ex)
            {
            }
        }

        public static void SaveProImgSlidePath(object ipro, HttpPostedFile fileUpload)
        {
            try
            {
                var pro = (Pro) ipro;
                //if (string.IsNullOrEmpty(pro.Img))
                //return Path.Combine(proPath, "default.png");


                string[] arrayPath =
                {
                    proPath,
                    pro.Shp.ShpName,
                    pro.ProName,
                    "Slides",
                    fileUpload.FileName
                };
                var path = string.Join(@"\", arrayPath);
                var proImgPath = Path.Combine(
                    HttpContext.Current.Server.MapPath("~")
                        .Substring(0, HttpContext.Current.Server.MapPath("~").Length - 1), path.Substring(1));

                var proImgPathOnly = Path.GetDirectoryName(proImgPath);

                if (proImgPath != _noImg)
                {
                    //bool exists = Directory.Exists(HostingEnvironment.MapPath(proImgPathOnly));
                    var exists = Directory.Exists(proImgPathOnly);
                    if (!exists)
                        //Directory.CreateDirectory(HostingEnvironment.MapPath(proImgPathOnly));
                        Directory.CreateDirectory(proImgPathOnly);
                }

                if (!string.IsNullOrEmpty(fileUpload.FileName))
                {
                    var fileName = Path.Combine(proImgPathOnly, fileUpload.FileName);
                    fileUpload.SaveAs(fileName);
                }
            }


            catch (Exception ex)
            {
            }
        }

        public static void Show(string message, string reUrl = "")
        {
            var cleanMessage = message.Replace("'", "\'");
            var page = HttpContext.Current.CurrentHandler as Page;
            var script = string.Format("alert('{0}');{1}", cleanMessage,
                reUrl != "" ? "window.location.href ='" + reUrl + "'" : "");
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
                page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", script, true /* addScriptTags */);
        }

        public static void ShowInUploadPannel(string message, string reUrl = "")
        {
            var cleanMessage = message.Replace("'", "\'");
            var TransferPage = string.Format("<script>alert('{0}');{1}</script>", cleanMessage,
                reUrl != "" ? "window.location.href ='" + reUrl + "'" : "");
            var currentPage = HttpContext.Current.Handler as Page;
            ScriptManager.RegisterStartupScript(currentPage, currentPage.GetType(), "temp2", TransferPage, false);
        }

        public static void ShowInUploadPannel(string message)
        {
            var TransferPage = $"<script>alert('{message}')</script>";
            var currentPage = HttpContext.Current.Handler as Page;
            ScriptManager.RegisterStartupScript(currentPage, currentPage.GetType(), "temp", TransferPage, false);
        }

        public static string ShpUrl(Shp obj)
        {
            return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority +
                   $"/{TextHelper.UrlFriendly(obj.ShpName)}";
        }

        public static string SlidePath(object img)
        {
            return Path.Combine(slidePath, img.ToString()).Replace(@"\", @"/");
        }
        public static string AlertShp(Shp shp, int year)
        {
            var s = "";
            if (Shp_Bus.CountRcptBuySuccess(shp, year) < 3)
                s = "<span class='alert alert-danger' role='alert'>Nguy hiểm</span>";
            return s;
        }

        public static string AlertShp(Shp shp, int month, int year)
        {
            var s = "";
            if (Shp_Bus.CountRcptBuySuccess(shp, month, year) < 3)
                s = "<span class='alert alert-danger' role='alert'>Nguy hiểm</span>";
            return s;
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

        public static string DrawStar(int star)
        {
            var sb = new StringBuilder();
            sb.Append(" <div class='rating__body' style='display:inline-block'>");
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
            return sb.ToString();
        }

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
        public static double SumIn(Shp shp)
        {
            var rs = RcptBuyDet_BUS.GetAll().Where(x => x.ShpId == shp.ShpId)
                .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.PriceWhenBuy)).Sum().ToString();
            return double.Parse(rs);
        }

        public static double SumIn(int ShpId, int month, int year)
        {
            if (month == 0)
            {
                var rs = RcptBuyDet_BUS.GetAll().Where(x => x.ShpId == ShpId)
                    .Where(x => x.RcptBuy.Rcpt.DateAdd.Year == year)
                    .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.PriceWhenBuy)).Sum().ToString();
                return double.Parse(rs);
            }

            if (year == 0)
            {
                var rs = RcptBuyDet_BUS.GetAll().Where(x => x.ShpId == ShpId)
                    .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.PriceWhenBuy)).Sum().ToString();
                return double.Parse(rs);
            }
            else
            {
                var rs = RcptBuyDet_BUS.GetAll().Where(x => x.ShpId == ShpId)
                    .Where(x => x.RcptBuy.Rcpt.DateAdd.Month == month && x.RcptBuy.Rcpt.DateAdd.Year == year)
                    .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.PriceWhenBuy)).Sum().ToString();
                return double.Parse(rs);
            }
        }

        public static double SumOut(int ShpId, int month, int year)
        {
            var merId = Shp_Bus.GetAll().Where(x => x.ShpId == ShpId).Select(x => x.MerId).FirstOrDefault();
            if (month == 0)
            {
                var rs = RcptSubDet_BUS.GetAll().Where(x => x.RcptSub.MerId == merId)
                    .Where(x => x.RcptSub.Rcpt.DateAdd.Year == year).Select(x =>
                        double.Parse(x.Quantity.ToString()) * double.Parse(x.Sub.Price.ToString())).Sum().ToString();
                return double.Parse(rs);
            }

            if (year == 0)
            {
                var rs = RcptSubDet_BUS.GetAll().Where(x => x.RcptSub.MerId == merId)
                    .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.Sub.Price.ToString())).Sum()
                    .ToString();
                return double.Parse(rs);
            }
            else
            {
                var rs = RcptSubDet_BUS.GetAll().Where(x => x.RcptSub.MerId == merId)
                    .Where(x => x.RcptSub.Rcpt.DateAdd.Month == month && x.RcptSub.Rcpt.DateAdd.Year == year)
                    .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.Sub.Price.ToString())).Sum()
                    .ToString();
                return double.Parse(rs);
            }
        }

        public static double SumOut(Shp shp)
        {
            var merId = Shp_Bus.GetAll().Where(x => x.ShpId == shp.ShpId).Select(x => x.MerId).FirstOrDefault();
            var rs = RcptSubDet_BUS.GetAll().Where(x => x.RcptSub.MerId == merId)
                .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.Sub.Price)).Sum().ToString();
            return double.Parse(rs);
        }

        public static double SumRcptSubPrice(RcptSub rcptSub)
        {
            var rs = RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == rcptSub.RcptSubId)
                .Select(x => double.Parse(x.Quantity.ToString()) * double.Parse(x.Sub.Price)).Sum();
            return double.Parse(rs.ToString());
        }
    }
}