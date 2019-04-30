using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using ShoesStore;
using System.Collections.Generic;
using System.Configuration;

namespace ShoesStore.Merchant
{
    public partial class SubGet : System.Web.UI.Page
    {
        protected static Pro _proDetView;
        protected static Mer _merView;
        private static List<ListViewItem> lstSub = new List<ListViewItem>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiviewSub.ActiveViewIndex = 0;
                lstSub = new List<ListViewItem>();
                LoadTableSub();
            }

        }

        public void LoadTableSub()
        {
            lvSub.DataSource = MyLibrary.Sub_BUS.GetAll();
            lvSub.DataBind();
        }

        protected void lvSub_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListViewItem rs = lvSub.Items[Int32.Parse(e.CommandArgument.ToString())];
            if (lstSub.Any(x => ((HiddenField)x.FindControl("hdfSubId")).Value == ((HiddenField)rs.FindControl("hdfSubId")).Value))
            {
                int slThem = Int32.Parse(((TextBox)rs.FindControl("Qty")).Text);
                int SubId = Int32.Parse(((HiddenField)rs.FindControl("hdfSubId")).Value);
                int slDaThem = Int32.Parse(lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == SubId).Select(x => ((TextBox)x.FindControl("Qty")).Text).FirstOrDefault().ToString());
                int slTong = slThem + slDaThem;
                string index = lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == Int32.Parse(((HiddenField)rs.FindControl("hdfSubId")).Value)).Select(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value)).FirstOrDefault().ToString();
                lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == SubId).Select(x => { ((TextBox)x.FindControl("Qty")).Text = slTong.ToString(); return x; }).FirstOrDefault();
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
            int ngay = 0;
            int tien = 0;
            for (int i = 0; i < lvSubSelected.Items.Count; i++)
            {
                ngay += Int32.Parse(((Label)lvSubSelected.Items[i].FindControl("lbTongNgay")).Text);
                tien += Int32.Parse(((Label)lvSubSelected.Items[i].FindControl("lbTongGia")).Text.Replace(",",string.Empty));
            }
            lbTongNgayMua.Attributes.Add("Style", "float: right");
            lbTongNgayMua.Text = "Tổng ngày: " + ngay;
            lbTongTien.Text = "Tổng tiền: " + tien.ToFormatMoney();
            if(lstSub.Count!= 0)
            {
                btnSwap.Visible = true;
            }
        }
        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HiddenField lviID = (HiddenField)e.Item.FindControl("lviID");
            lviID.Value = ((HiddenField)lstSub[e.Item.DataItemIndex].FindControl("hdfSubId")).Value;
            Label lbTen = (Label)e.Item.FindControl("lbTen");
            Label lbSoLuongGoi = (Label)e.Item.FindControl("lbSoLuongGoi");
            Label lbTongNgay = (Label)e.Item.FindControl("lbTongNgay");
            Label lbTongGia = (Label)e.Item.FindControl("lbTongGia");
            lbTen.Text = ((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrSubContent")).Text;
            lbSoLuongGoi.Text = ((TextBox)lstSub[e.Item.DataItemIndex].FindControl("Qty")).Text;
            lbTongNgay.Text = (Int32.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrDurday")).Text) * Int32.Parse(lbSoLuongGoi.Text)).ToString();
            lbTongGia.Text = (Int32.Parse((((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrPrice")).Text).Replace(",",string.Empty)) * Int32.Parse(lbSoLuongGoi.Text)).ToFormatMoney();

        }

        protected void lvSub_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void lvSubSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                if (lstSub.Count==0)
                {
                    lbEmptySelected.Visible = true;
                }
                else
                {
                    lstSub.RemoveAt(Int32.Parse(e.CommandArgument.ToString()));
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
    }
}