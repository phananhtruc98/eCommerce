using System;
using System.Linq;
using System.Net;
using System.Web.UI;
using log4net;
using Newtonsoft.Json;
using ShoesStore.Captcha;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class ThanhToan : Page
    {
        private static readonly ILog log = LogHelper.GetLogger();


        protected void btnOrder_OnClick(object sender, EventArgs e)
        {
            if (checkout_terms.Checked)
            {
                var response = Request["g-recaptcha-response"];

                const string secret = "6Lecx6EUAAAAANBVbdksO6Le72ZTcO1Kk0g3IarA";
                var client = new WebClient();
                var reply = client.DownloadString(
                    $"https://www.google.com/recaptcha/api/siteverify?secret={secret}&response={response}"
                );
                var captchaResponse = JsonConvert.DeserializeObject<CaptchaResponse>(reply);

                if (!captchaResponse.Success)
                {
                    if (captchaResponse.ErrorCodes.Count < 0) MyLibrary.Show("..");
                    var error = captchaResponse.ErrorCodes[0].ToLower();
                    switch (error)
                    {
                        case "missing-input-secret":
                            MyLibrary.Show("Thiếu tham số");
                            break;
                        case "invalid-input-secret":
                            MyLibrary.Show("Bạn chưa kiểm ra captcha");
                            break;
                        case "missing-input-response":
                            MyLibrary.Show("Thiếu tham số phản hồi");
                            break;
                        case "invalid-input-response":
                            MyLibrary.Show("Phản hồi không hợp lệ");
                            break;
                        default:
                            MyLibrary.Show("Lỗi captcha !");
                            break;
                    }

                    return;
                }

                var groupByShop = MyLibrary.CartDet_BUS.GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId)
                    .GroupBy(m => new {m.Cart.CusId, m.ShpId});
                foreach (var group in groupByShop)
                {
                    var rcpt = new Rcpt
                    {
                        UsrAdd = group.FirstOrDefault().ProDet.Pro.Shp.MerId,
                        DateAdd = DateTime.Now,
                        IsCompleted = false
                    };
                    MyLibrary.Rcpt_BUS.Insert(rcpt);
                    var rcptId = MyLibrary.Rcpt_BUS.getMaxRcptId();
                    var rcptBuy = new RcptBuy
                    {
                        RcptBuyId = rcptId,
                        ShpId = group.Key.ShpId,
                        CusId = WebSession.LoginCus.CusId
                    };
                    MyLibrary.RcptBuy_BUS.Insert(rcptBuy);
                    //Thêm bảng RcptBuySta (trạng thái cho 1 đơn hàng của 1 shop)
                    var rcptBuySta = new RcptBuySta
                    {
                        //StaId tự động tăng
                        RcptBuyId = rcptBuy.RcptBuyId
                    };
                    MyLibrary.RcptBuySta_BUS.Insert(rcptBuySta);
                    rcptBuySta = MyLibrary.RcptBuySta_BUS.GetLast();
                    //Thêm bảng RcptBuyStaDet (gán tình trạng cho bảng RcptBuySta)
                    //RcptBuyStaDet rcptBuyStaDet = new RcptBuyStaDet()
                    //{
                    //StaId = rcptBuySta.StaId,
                    //RcptBuyId = rcptBuy.RcptBuyId,
                    //StepId = 1
                    //};
                    MyLibrary.RcptBuyStaDet_BUS.Insert(rcptBuySta, 1);
                    foreach (var groupItem in group)
                    {
                        var rcptBuyDet = new RcptBuyDet
                        {
                            RcptBuyId = rcptBuy.RcptBuyId,
                            ShpId = group.Key.ShpId,
                            ProId = groupItem.ProId,
                            ColorId = groupItem.ColorId,
                            SizeId = groupItem.SizeId,
                            Quantity = groupItem.Qty,
                            PriceWhenBuy = MyLibrary.Pro_BUS.GetPrice(groupItem.ProDet.Pro)
                        };
                        MyLibrary.RcptBuyDet_BUS.Insert(rcptBuyDet);
                        MyLibrary.CartDet_BUS.Delete(groupItem);
                    }

                    log.Info($"Cus with id {WebSession.LoginCus.CusId} submit a RcptBuy with id {rcptBuy.RcptBuyId}");
                }

                MyLibrary.Show("Đã thanh toán thành công, đơn hàng sẽ xác nhận trong thời gian sớm nhất !",
                    Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/'));
            }
            else
            {
                MyLibrary.ShowInUploadPannel("Thanh toán không thành công, vui lòng kiểm tra lại !");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                checkoutContent.DataBind();
                //
                if (MyLibrary.CartDet_BUS.ListCartPreview() == null ||
                    MyLibrary.CartDet_BUS.ListCartPreview().Count == 0)
                    checkoutContent.InnerText = "Không có sản phẩm trong giỏ hàng!";
                if (WebSession.LoginCus == null)
                {
                    MyLibrary.Show("Bạn chưa đăng nhập");
                    Response.Redirect("/");
                }

                rptCartDetCheckout.DataSource = MyLibrary.CartDet_BUS.ListCartPreview();
                rptCartDetCheckout.DataBind();
            }
        }
    }
}