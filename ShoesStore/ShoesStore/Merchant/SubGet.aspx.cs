using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using ShoesStore;
using System.Collections.Generic;

namespace ShoesStore.Merchant
{
    public partial class SubGet : System.Web.UI.Page
    {
        protected static Pro _proDetView;
        protected static Mer _merView;
        static List<ListViewItem> lstSub = new List<ListViewItem>();
        //Khai báo biến Sub

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            if (lstSub.Any(x => ((Literal)x.FindControl("ltrSubContent")).Text == ((Literal)rs.FindControl("ltrSubContent")).Text))
            {
                lstSub.Select(x => ((Literal)x.FindControl("ltrSubContent")).Text);
            }
            lstSub.Add(rs);
            LoadSubSelected();
        }

        public void LoadSubSelected()
        {
            lvSubSelected.DataSource = lstSub;
            lvSubSelected.DataBind();

        }
        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HiddenField lviID = (HiddenField)e.Item.FindControl("lviID");
            lviID.Value = ((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrSubId")).Text;
            Label lbTen = (Label)e.Item.FindControl("lbTen");
            Label lbSoLuongGoi = (Label)e.Item.FindControl("lbSoLuongGoi");
            Label lbTongNgay = (Label)e.Item.FindControl("lbTongNgay");
            Label lbTongGia = (Label)e.Item.FindControl("lbTongGia");
            lbTen.Text = ((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrSubContent")).Text;
            lbSoLuongGoi.Text = ((TextBox)lstSub[e.Item.DataItemIndex].FindControl("Qty")).Text;
            lbTongNgay.Text = (Int32.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrDurday")).Text) * Int32.Parse(lbSoLuongGoi.Text)).ToString();
            lbTongGia.Text = (Int32.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrPrice")).Text) * Int32.Parse(lbSoLuongGoi.Text)).ToString();

        }

        protected void lvSub_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}