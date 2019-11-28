using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Xceed.Document.NET;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using Xceed.Words.NET;
using ListItemType = System.Web.UI.WebControls.ListItemType;
using Paragraph = Xceed.Document.NET.Paragraph;
using Font = Xceed.Document.NET.Font;
using Document = iTextSharp.text.Document;

namespace ShoesStore.Merchant
{
    public partial class Merchant_Rcpt_Det : Page
    {
        private int CusIdTemp;
        private string dateadd = "";
        private RcptBuy rcptBuy = new RcptBuy();
        private int RcptBuyId;
        private string statusName = "";
        private string rcptOrder = "";
        public void BindDataLvRcptBuyDet(int RcptId, int CusId)
        {
            rptRcptShp.DataSource = MyLibrary.RcptBuy_BUS.ListRcptBuyPreview_Shop(RcptId, CusId);
            rptRcptShp.DataBind();
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            rcptBuy = MyLibrary.RcptBuy_BUS.GetAll()
                .FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
            rcptBuy.MerMessage = review_text.Text;
            rcptBuy.MerPoint = int.Parse(review_stars.SelectedValue.Split(' ')[0]);
            MyLibrary.RcptBuy_BUS.Update(rcptBuy);
            MyLibrary.Show("Đã thêm nhận xét", Request.RawUrl);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RcptBuyId = int.Parse(Request.QueryString["RcptBuyId"]);
                rcptOrder = this.RcptBuyId.ToString();
                rcptBuy = MyLibrary.RcptBuy_BUS.GetAll()
                    .FirstOrDefault(m => m.RcptBuyId == int.Parse(Request.QueryString["RcptBuyId"]));
                if (string.IsNullOrEmpty(rcptBuy.MerMessage))
                {
                }
                else

                {
                    DivWriteComment.Controls.Clear();
                    var txtComment = new Label
                    {
                        Text = MyLibrary.DrawStar(rcptBuy.MerPoint.Value) + "</br>" + "Nhận xét của tôi: " +
                               rcptBuy.MerMessage
                    };
                    DivWriteComment.Controls.Add(txtComment);
                }

                var status = int.Parse(Request.QueryString["Sta"]);
                switch (status)
                {
                    case 1:
                        statusName = "<span class='text-warning'>Đang xác nhận</span>";
                        break;
                    case 2:
                        statusName = "<span class='text-primary'>Đã xác nhận</span>";
                        break;
                    case 3:
                        statusName = "<span class='text-info'>Chờ đi nhận</span>";
                        break;
                    case 4:
                        statusName = "<span class='text-info'>Đang đi nhận</span<";
                        break;
                    case 5:
                        statusName = "<span class='text-info'>Đã nhận hàng</span>";
                        break;
                    case 6:
                        statusName = "<span class='text-info'>Đang chuyển</span>";
                        break;
                    case 7:
                        statusName = "<span class='text-success'>Đã giao</span>";
                        break;
                    case 9:
                        statusName = "<span class='text-danger'>Đã hủy</span>";
                        break;
                    case 10:
                        statusName = "<span class='text-danger'>Đã hủy</span>";
                        break;
                }

                var d = (from r in MyLibrary.Rcpt_BUS.GetAll()
                         where r.RcptId == RcptBuyId
                         select r.DateAdd).Single();
                dateadd = d.ToString();
                lbRcptBuyId.Text = "Đơn hàng #" + RcptBuyId;
                lbRcptBuyDate.Text = "Ngày đặt hàng: " + dateadd;
                lbRcptBuySta.Text = "Tình trạng đơn hàng: " + statusName;
                lbRcptBuyId.Visible = true;
                lbRcptBuyDate.Visible = true;
                rowRcptBuyDet.Visible = true;
                var s = (from rb in MyLibrary.RcptBuy_BUS.GetAll()
                         where rb.RcptBuyId == RcptBuyId
                         select rb.Shp).FirstOrDefault();
                lbShpName.Text = s.ShpName;
                lbAddress.Text = s.Address;
                lbPhone.Text = s.Phone;

                var z = (from rb in MyLibrary.RcptBuy_BUS.GetAll()
                         where rb.RcptBuyId == RcptBuyId
                         select rb.Cus).FirstOrDefault();
                lbCusName.Text = z.Usr.UsrName;
                lbAddressCus.Text = z.Usr.Address;
                lbPhoneCus.Text = z.Usr.Phone;
                lbEmail.Text = z.Usr.Email;
                CusIdTemp = z.CusId;
                BindDataLvRcptBuyDet(RcptBuyId, z.CusId);
            }
        }

        protected void rptRcptShp_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var hdfShpId = (HiddenField)e.Item.FindControl("hdfShpId");
                var ShpId = int.Parse(hdfShpId.Value);
                var rptRcptShpDet = (Repeater)e.Item.FindControl("rptRcptShpDet");
                rptRcptShpDet.DataSource = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptBuyId, CusIdTemp)
                    .Where(m => m.ShpId + "" == hdfShpId.Value);
                rptRcptShpDet.DataBind();
            }
        }


        protected void rptRcptShpDet_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }
        protected void btnPrintRcpt_OnClick(object sender, EventArgs e)
        {
            CreateWordFile();
            CreatePdf();
        }

        public void CreateWordFile()
        {
            rcptOrder = int.Parse(Request.QueryString["RcptBuyId"]).ToString();
            var d = (from r in MyLibrary.Rcpt_BUS.GetAll()
                     where r.RcptId == int.Parse(rcptOrder)
                     select r.DateAdd).Single();
            var z = (from rb in MyLibrary.RcptBuy_BUS.GetAll()
                     where rb.RcptBuyId == int.Parse(rcptOrder)
                     select rb.Cus).FirstOrDefault();
            dateadd = d.ToString();
            CusIdTemp = z.CusId;
            // Modify to suit your machine:
            string path = Server.MapPath("~");
            string fileName = path + "HD" + rcptOrder + ".docx";
            // Create a document in memory:
            var doc = DocX.Create(fileName);
            Paragraph headLineText = doc.InsertParagraph();
            headLineText.Append("SHUZ")
                .Font(new Font("Times New Roman")).FontSize(32).Bold();
            headLineText.Alignment = Alignment.center;
            headLineText.AppendLine("-------------------------");
            // Insert a paragrpah:
            //Receipt info
            Paragraph rcpt = doc.InsertParagraph();
            rcpt.Append("Ngày đặt hàng: " + dateadd)
                .Font(new Font("Times New Roman")).FontSize(16).Italic().AppendLine();
            rcpt.Append("Mã đơn hàng: " + rcptOrder)
                .Font(new Font("Times New Roman")).FontSize(16).Italic().AppendLine();
            rcpt.AppendLine("-------------------------");
            //Merchant info
            Paragraph merchantInfo = doc.InsertParagraph();
            merchantInfo.LineSpacing = 14f;
            merchantInfo.Append("Thông tin cửa hàng").Font(new Font("Times New Roman")).FontSize(20).Bold().AppendLine()
                .Append("Tên CH: " + lbShpName.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine()
                .Append("Địa chỉ CH: " + lbAddress.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine()
                .Append("Số điện thoại: " + lbPhone.Text).Font(new Font("Times New Roman")).FontSize(16);
            merchantInfo.AppendLine("-------------------------");

            //Customer info
            Paragraph cusInfo = doc.InsertParagraph();
            cusInfo.LineSpacing = 14f;
            cusInfo.Append("Thông tin khách hàng").Font(new Font("Times New Roman")).FontSize(20).Bold().AppendLine()
                .Append("Tên KH: " + lbCusName.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine()
                .Append("Địa chỉ KH: " + lbAddressCus.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine()
                .Append("Số điện thoại: " + lbPhoneCus.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine()
                .Append("Email: " + lbEmail.Text).Font(new Font("Times New Roman")).FontSize(16).AppendLine();
            //Product List
            Paragraph products = doc.InsertParagraph();
            products.LineSpacing = 14f;
            var rcptDetailList = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.RcptBuyId == int.Parse(rcptOrder)).ToList();
            Xceed.Document.NET.Table tblProducts = doc.InsertTable(rcptDetailList.Count + 1, 6);
            tblProducts.Rows[0].Cells[0].Paragraphs.First().Append("Tên sản phẩm").Bold();
            tblProducts.Rows[0].Cells[1].Paragraphs.First().Append("Màu").Bold();
            tblProducts.Rows[0].Cells[2].Paragraphs.First().Append("Kích cỡ").Bold();
            tblProducts.Rows[0].Cells[3].Paragraphs.First().Append("Số lượng").Bold();
            tblProducts.Rows[0].Cells[4].Paragraphs.First().Append("Đơn giá").Bold();
            tblProducts.Rows[0].Cells[5].Paragraphs.First().Append("Giá").Bold();
            int sumPrice = 0;
            for (int i = 0; i < rcptDetailList.Count; i++)
            {
                tblProducts.Rows[i + 1].Cells[0].Paragraphs.First().Append(rcptDetailList[i].ProDet.Pro.ProName);
                tblProducts.Rows[i + 1].Cells[1].Paragraphs.First().Append(rcptDetailList[i].ProDet.ProColor.ColorName);
                tblProducts.Rows[i + 1].Cells[2].Paragraphs.First().Append(rcptDetailList[i].ProDet.ProSize.SizeName);
                var qty = rcptDetailList[i].Quantity;
                var price = rcptDetailList[i].PriceWhenBuy;
                int priceEachProduct = qty.Value * int.Parse(price);
                tblProducts.Rows[i + 1].Cells[3].Paragraphs.First().Append(qty.ToString());
                tblProducts.Rows[i + 1].Cells[4].Paragraphs.First().Append(price.ToFormatMoney());
                tblProducts.Rows[i + 1].Cells[5].Paragraphs.First().Append(priceEachProduct.ToFormatMoney());
                sumPrice = sumPrice + priceEachProduct;
            }
            Paragraph totalPrice = doc.InsertParagraph();
            totalPrice.Append("Tổng: " + sumPrice.ToFormatMoney()).Font(new Font("Times New Roman")).FontSize(20).Bold().Alignment = Alignment.right;

            // Save to the output directory:
            doc.Save();
            // Parse Word to Pdf
            // Open in Word:
            Process.Start("WINWORD.EXE", fileName);
        }
        public void CreatePdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            panelPdf.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4,10f,10f,100f,10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlParser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        //public override void VerifyRenderingInServerForm(Control control)
        //{
            
        //}
    }
}