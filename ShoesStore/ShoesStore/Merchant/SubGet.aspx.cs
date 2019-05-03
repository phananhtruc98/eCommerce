using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using ShoesStore.Paypal;

namespace ShoesStore.Merchant
{
    public partial class SubGet : Page
    {
        protected static Pro _proDetView;
        protected static Mer _merView;
        private static List<ListViewItem> lstSub = new List<ListViewItem>();


        private Payment payment;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiviewSub.ActiveViewIndex = 0;
                lstSub = new List<ListViewItem>();
                LoadTableSub();
                var payerId = Request.Params["PayerId"] + "";
                if (!string.IsNullOrEmpty(payerId))
                {
                    var pageUrl = Request.Url.Scheme + "://" + Request.Url.Authority + "/nguoi-ban/quan-ly-sub/dang-ky";
                    var apiContext = PaypalConfiguration.GetAPIContext();
                    var guid = Request.Params["guid"];
                    var excutePayment = ExcutePayment(apiContext, payerId, Session[guid] as string);
                    if (excutePayment.state.ToLower() != "approved")
                    {

                        
                        MyLibrary.Show("Thất bại", pageUrl);
                    }
                    else
                    {
                        List<SubQty> subQties = ((IEnumerable<SubQty>)Session["listSubs"]).ToList();
                        RcptSub rcptSub = new RcptSub()
                        {
                            MerId = MerchantSession.LoginMer.MerId,
                            Status = true
                        };
                        Rcpt rcpt = new Rcpt()
                        {
                            UsrAdd = rcptSub.MerId.Value,
                            IsCompleted = true,
                            DateAdd = DateTime.Now,
                            DateEdit = null
                        };
                   
                        MyLibrary.Rcpt_BUS.Insert(rcpt);
                        rcptSub.RcptSubId = MyLibrary.Rcpt_BUS.GetAll().Last().RcptId;
                        MyLibrary.RcptSub_BUS.Insert(rcptSub);
                        foreach (var subQty in subQties)
                        {
                            RcptSubDet rcptSubDet = new RcptSubDet()
                            {
                                RcptSubId = MyLibrary.RcptSub_BUS.GetLast().RcptSubId,
                                SubId = subQty.MySub.SubId,
                                Quantity = subQty.MyQty
                            };

                            MyLibrary.RcptSubDet_BUS.Insert(rcptSubDet);
                        }
                        MyLibrary.Show("Thành công", pageUrl);
                    }
                }
            }
        }

        public void LoadTableSub()
        {
            lvSub.DataSource = MyLibrary.Sub_BUS.GetAll();
            lvSub.DataBind();
        }

        protected void lvSub_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListViewItem rs = lvSub.Items[int.Parse(e.CommandArgument.ToString())];
            if (lstSub.Any(x =>
                ((HiddenField)x.FindControl("hdfSubId")).Value == ((HiddenField)rs.FindControl("hdfSubId")).Value))
            {
                var slThem = int.Parse(((TextBox)rs.FindControl("Qty")).Text);
                var subId = int.Parse(((HiddenField)rs.FindControl("hdfSubId")).Value);
                var slDaThem = int.Parse(lstSub
                                             .Where(x => int.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == subId)
                                             .Select(x => ((TextBox)x.FindControl("Qty")).Text).FirstOrDefault() ?? throw new InvalidOperationException());
                var slTong = slThem + slDaThem;
                var firstOrDefault = lstSub.Where(x => int.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == subId).Select(x =>
               {
                   ((TextBox)x.FindControl("Qty")).Text = slTong.ToString();
                   return x;
               }).FirstOrDefault();
                LoadSubSelected();
            }
            else
            {
                lstSub.Add(rs);
                LoadSubSelected();
            }
        }

        public void LoadSubSelected()
        {
            lvSubSelected.DataSource = lstSub;
            lvSubSelected.DataBind();
            var ngay = 0;
            var tien = 0;
            for (var i = 0; i < lvSubSelected.Items.Count; i++)
            {
                ngay += int.Parse(((Label)lvSubSelected.Items[i].FindControl("lbTongNgay")).Text);
                tien += int.Parse(
                    ((Label)lvSubSelected.Items[i].FindControl("lbTongGia")).Text.Replace(",", string.Empty));
            }

            lbTongNgayMua.Attributes.Add("Style", "float: right");
            lbTongNgayMua.Text = "Tổng ngày: " + ngay;
            lbTongTien.Text = "Tổng tiền: " + tien.ToFormatMoney();
            hdfSumMoney.Value = tien.ToString();
            if (lstSub.Count != 0) btnSwap.Visible = true;
        }

        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var lviID = (HiddenField)e.Item.FindControl("lviID");
            lviID.Value = ((HiddenField)lstSub[e.Item.DataItemIndex].FindControl("hdfSubId")).Value;
            var lbTen = (Label)e.Item.FindControl("lbTen");
            var lbSoLuongGoi = (Label)e.Item.FindControl("lbSoLuongGoi");
            var lbTongNgay = (Label)e.Item.FindControl("lbTongNgay");
            var lbTongGia = (Label)e.Item.FindControl("lbTongGia");
            lbTen.Text = ((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrSubContent")).Text;
            lbSoLuongGoi.Text = ((TextBox)lstSub[e.Item.DataItemIndex].FindControl("Qty")).Text;
            lbTongNgay.Text = (int.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrDurday")).Text) *
                               int.Parse(lbSoLuongGoi.Text)).ToString();
            lbTongGia.Text =
                (int.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrPrice")).Text.Replace(",",
                     string.Empty)) * int.Parse(lbSoLuongGoi.Text)).ToFormatMoney();
        }

        protected void lvSub_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void lvSubSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                if (lstSub.Count == 0)
                {
                    lbEmptySelected.Visible = true;
                }
                else
                {
                    lstSub.RemoveAt(int.Parse(e.CommandArgument.ToString()));
                    LoadSubSelected();
                }
            }
        }

        protected void lvSubSelected_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
        }

        protected void btnSwap_Click(object sender, EventArgs e)
        {
            MultiviewSub.ActiveViewIndex = 1;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiviewSub.ActiveViewIndex = 0;
        }

        private Payment CreatePayment(APIContext apiContext, string redirectUrl, string guid)
        {
            var listSubs = lstSub.Select(x =>
            {
                var sub = MyLibrary.Sub_BUS.GetById(Convert.ToInt32(((HiddenField)x.FindControl("hdfSubId")).Value));
                var qty = Convert.ToInt32(((TextBox)x.FindControl("Qty")).Text);
                return new SubQty
                {
                    MySub = sub,
                    MyQty = qty
                };
            });
            Session["listSubs"] = listSubs;
            var listItems = new ItemList { items = new List<Item>() };
            foreach (var sub in listSubs)
                listItems.items.Add(new Item
                {
                    name = sub.MySub.SubContent,
                    currency = "USD",
                    price = sub.MySub.Price,
                    sku = sub.MySub.SubId.ToString(),
                    quantity = sub.MyQty.ToString()
                });

            var payer = new Payer { payment_method = "paypal" };
            var redirUrls = new RedirectUrls
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };
            //Create detail object
            var details = new Details
            {
                subtotal = listSubs.Sum(m => m.MyQty * Convert.ToInt32(m.MySub.Price)).ToString()
            };

            //Create amount of object
            var amount = new Amount
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) +
                         Convert.ToDouble(details.subtotal)).ToString(),
                details = details
            };
            //Create transaction
            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction
            {
                description = "ShoesStore thông tin giao dịch",
                invoice_number = new Random().Next(100000).ToString(),//
                amount = amount,
                item_list = listItems
            });

            payment = new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            {
                return payment.Create(apiContext);
            }
        }

        //Create Excute Payment Method
        private Payment ExcutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExcution = new PaymentExecution
            {
                payer_id = payerId
            };

            payment = new Payment { id = paymentId };
            return payment.Execute(apiContext, paymentExcution);
        }

        protected void imgBtnPaypal_Click(object sender, ImageClickEventArgs e)
        {
            var apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                //string payerId = MerchantSession.LoginMer.Usr.UsrId + "";
                var payerId = Request.Params["PayerId"] + "";
                if (string.IsNullOrEmpty(payerId))
                {
                    var baseUri = Request.Url.Scheme + "://" + Request.Url.Authority +
                                  "/nguoi-ban/quan-ly-sub/dang-ky?";
                    var guid = MyLibrary.Rcpt_BUS.GetAll().Last().RcptId + 1 + "";
                    var createdPayment = CreatePayment(apiContext, baseUri + "guid=" + guid, guid);

                    //
                    var links = createdPayment.links.GetEnumerator();
                    var paypalRedirectUrl = string.Empty;

                    while (links.MoveNext())
                    {
                        var link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url")) paypalRedirectUrl = link.href;
                    }

                    Session.Add(guid, createdPayment.id);
                    //
                    Response.Redirect(paypalRedirectUrl);
                }
            }

            catch (Exception ex)
            {
                PaypalLogger.Log("Lỗi: " + ex.Message);
                MyLibrary.Show("Lỗi");
            }



            MyLibrary.Show("Thành công");
        }

        private class SubQty
        {
            public Sub MySub { get; set; }
            public int MyQty { get; set; }
        }
    }
}