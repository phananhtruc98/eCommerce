using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class CreateNewRcptSub : Page
    {
        private static readonly List<ListViewItem> lstSub = new List<ListViewItem>();

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var rcptSub = new RcptSub
            {
                MerId = int.Parse(ddtMerName.SelectedValue),
                Status = true
            };
            var rcpt = new Rcpt
            {
                UsrAdd = rcptSub.MerId.Value,
                IsCompleted = true,
                DateAdd = DateTime.Now,
                DateEdit = null
            };

            MyLibrary.Rcpt_BUS.Insert(rcpt);
            rcptSub.RcptSubId = MyLibrary.Rcpt_BUS.GetAll().Last().RcptId;
            MyLibrary.RcptSub_BUS.Insert(rcptSub);
            foreach (var subQty in lstSub)
            {
                var rcptSubDet = new RcptSubDet
                {
                    RcptSubId = MyLibrary.RcptSub_BUS.GetLast().RcptSubId,
                    SubId = Convert.ToInt32(((Literal) subQty.FindControl("ltrSubId")).Text),
                    Quantity = Convert.ToInt32(((TextBox) subQty.FindControl("Qty")).Text)
                };

                MyLibrary.RcptSubDet_BUS.Insert(rcptSubDet);
            }

            MyLibrary.Show($"Đã tạo hóa đơn thành công. Mã hóa đơn:{rcptSub.RcptSubId} ", Request.RawUrl);
        }

        protected void btnTiep_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            SetShpInfo(int.Parse(ddtMerName.SelectedValue));
        }

        protected void ddtMerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            var merId = int.Parse(ddtMerName.SelectedValue);
            SetShpInfo(merId);
        }

        public void LoadDdlMerName()
        {
            var rs = (from u in MyLibrary.Usr_BUS.GetAll()
                join m in MyLibrary.Mer_BUS.GetAll() on u.UsrId equals m.MerId
                select new
                {
                    u.UsrName, u.UsrId
                }).ToList();
            ddtMerName.DataSource = rs;
            ddtMerName.DataTextField = "UsrName";
            ddtMerName.DataValueField = "UsrId";
            ddtMerName.DataBind();
        }

        public void LoadSubSelected()
        {
            btnTiep.Visible = true;
            lvSubSelected.DataSource = lstSub;
            lvSubSelected.DataBind();
            var ngay = 0;
            var tien = 0;
            for (var i = 0; i < lvSubSelected.Items.Count; i++)
            {
                ngay += int.Parse(((Label) lvSubSelected.Items[i].FindControl("lbTongNgay")).Text);
                tien += int.Parse(
                    ((Label) lvSubSelected.Items[i].FindControl("lbTongGia")).Text.Replace(",", string.Empty));
            }

            lbTongNgayMua.Attributes.Add("Style", "float: right");
            lbTongNgayMua.Text = ngay.ToString();
            lbTongTien.Text = tien.ToFormatMoney();
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
                ((HiddenField) x.FindControl("hdfSubId")).Value == ((HiddenField) rs.FindControl("hdfSubId")).Value))
            {
                var slThem = int.Parse(((TextBox) rs.FindControl("Qty")).Text);
                var SubId = int.Parse(((HiddenField) rs.FindControl("hdfSubId")).Value);
                var slDaThem = int.Parse(lstSub
                    .Where(x => int.Parse(((HiddenField) x.FindControl("hdfSubId")).Value) == SubId)
                    .Select(x => ((TextBox) x.FindControl("Qty")).Text).FirstOrDefault().ToString());
                var slTong = slThem + slDaThem;
                var index = lstSub
                    .Where(x => int.Parse(((HiddenField) x.FindControl("hdfSubId")).Value) ==
                                int.Parse(((HiddenField) rs.FindControl("hdfSubId")).Value))
                    .Select(x => int.Parse(((HiddenField) x.FindControl("hdfSubId")).Value)).FirstOrDefault()
                    .ToString();
                lstSub.Where(x => int.Parse(((HiddenField) x.FindControl("hdfSubId")).Value) == SubId).Select(x =>
                {
                    ((TextBox) x.FindControl("Qty")).Text = slTong.ToString();
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

        protected void lvSubSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                if (lstSub.Count == 0)
                {
                    lbEmptySelected.Visible = true;
                    btnTiep.Visible = false;
                }
                else
                {
                    lstSub.RemoveAt(int.Parse(e.CommandArgument.ToString()));
                    LoadSubSelected();
                }
            }
        }

        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var lviID = (HiddenField) e.Item.FindControl("lviID");
            lviID.Value = ((HiddenField) lstSub[e.Item.DataItemIndex].FindControl("hdfSubId")).Value;
            var lbTen = (Label) e.Item.FindControl("lbTen");
            var lbSoLuongGoi = (Label) e.Item.FindControl("lbSoLuongGoi");
            var lbTongNgay = (Label) e.Item.FindControl("lbTongNgay");
            var lbTongGia = (Label) e.Item.FindControl("lbTongGia");
            lbTen.Text = ((Literal) lstSub[e.Item.DataItemIndex].FindControl("ltrSubContent")).Text;
            lbSoLuongGoi.Text = ((TextBox) lstSub[e.Item.DataItemIndex].FindControl("Qty")).Text;
            lbTongNgay.Text = (int.Parse(((Literal) lstSub[e.Item.DataItemIndex].FindControl("ltrDurday")).Text) *
                               int.Parse(lbSoLuongGoi.Text)).ToString();
            lbTongGia.Text =
                (int.Parse(((Literal) lstSub[e.Item.DataItemIndex].FindControl("ltrPrice")).Text.Replace(",",
                     string.Empty)) * int.Parse(lbSoLuongGoi.Text)).ToFormatMoney();
        }

        protected void lvSubSelected_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                LoadTableSub();
                LoadDdlMerName();
            }
        }

        private void SetShpInfo(int merId)
        {
            var rs = (from s in MyLibrary.Shp_Bus.GetAll()
                where s.MerId == merId
                select s.ShpName).FirstOrDefault();
            lbShpName.Text = rs;
            lbTotalDay.Text = lbTongNgayMua.Text;
            lbTotalPrice.Text = lbTongTien.Text;
        }
    }
}