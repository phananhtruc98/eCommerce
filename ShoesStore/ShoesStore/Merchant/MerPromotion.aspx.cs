using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class MerPromotion : System.Web.UI.Page
    {
        public static List<Pro> lstProSelected = new List<Pro>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lstProSelected.Clear();
                LoadLvPro();
            }

        }

        public void LoadLvPro()
        {
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.Active == true
                      select p).ToList();
            if (rs.Count != 0)
            {
                lvPro.DataSource = rs;
                lvPro.DataBind();
            }
            else { lbEmpty.Visible = true; }
        }

        protected void lvPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int ProId = Int32.Parse(e.CommandArgument.ToString());
            HiddenField ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            int ShpId = Int32.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                          where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                          select p).FirstOrDefault();
                if (lstProSelected.Contains(rs))
                { return; }
                else
                {
                    lstProSelected.Add(rs);
                    LoadlvProPromo();
                }
            }
            else if (e.CommandName == "Sel")
            {
                Server.Transfer("/Merchant/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId=" + ShpId);
            }
        }

        protected void lvPro_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvPro();
        }

        public void LoadlvProPromo()
        {
            lvProPromo.DataSource = lstProSelected;
            lvProPromo.DataBind();
        }

        protected void lvProPromo_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int ProId = Int32.Parse(e.CommandArgument.ToString());
            HiddenField ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            int ShpId = Int32.Parse(ShpIdhdf.Value);
            TextBox txtTien = (TextBox)e.Item.FindControl("txtMoney");
            Label lbPrice = (Label)e.Item.FindControl("lbPrice");
            Label lbPriceAfter = (Label)e.Item.FindControl("lbPriceAfter");
            var price = (from p in MyLibrary.Pro_BUS.GetAll()
                         where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                         select p.Price).FirstOrDefault();
            var pro1 = (from p in MyLibrary.Pro_BUS.GetAll()
                         where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                         select p).FirstOrDefault();
            if (e.CommandName == "Submit")
            {
                var pro = (from p in MyLibrary.Pro_BUS.GetAll()
                             where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                             select p).FirstOrDefault();
                
                pro.PriceAfter = lbPriceAfter.Text;
                MyLibrary.Pro_BUS.Update(pro);
                lstProSelected.Remove(pro);
            }
            else if (e.CommandName == "Check")
            {
                double priceAfter = 0;
                if (rdbtnPromoMode.SelectedValue == "")
                {
                    MyLibrary.Show("Chưa chọn cách thức giảm giá");
                    return;
                }
                if (txtTien.Text == "")
                {
                    MyLibrary.Show("Chưa nhập giá trị giảm");
                    return;
                }
                if (rdbtnPromoMode.SelectedValue == "Percent")
                {
                    priceAfter = Double.Parse(price) - (Double.Parse(price) / 100 * Double.Parse(txtTien.Text));
                    lbPriceAfter.Text = priceAfter.ToFormatMoney();
                }
                else if (rdbtnPromoMode.SelectedValue == "Direct")
                {
                    priceAfter = Double.Parse(price) - Double.Parse(txtTien.Text);
                    lbPriceAfter.Text = priceAfter.ToFormatMoney();
                }
                if (priceAfter < 0)
                {
                    lbPriceAfter.Text = "0";
                }
            }
            else if(e.CommandName=="Del")
            {
                lstProSelected.Remove(pro1);
                LoadlvProPromo();
            }
        }
    }
}