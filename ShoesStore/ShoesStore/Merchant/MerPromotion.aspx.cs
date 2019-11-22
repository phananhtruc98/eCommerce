using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class MerPromotion : Page
    {
        public static List<Pro> lstProSelected = new List<Pro>();

        public void LoadLvPro()
        {
            var mer = (Mer) MerchantSession.LoginMerchant;
            var ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId)
                .FirstOrDefault();
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                where p.Active == true && p.ShpId == ShpId
                select p).ToList();
            if (rs.Count != 0)
            {
                lvPro.DataSource = rs;
                lvPro.DataBind();
            }
            else
            {
                lbEmpty.Visible = true;
            }
        }

        public void LoadlvProPromo()
        {
            lvProPromo.DataSource = lstProSelected;
            lvProPromo.DataBind();
        }

        protected void lvPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField) e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                    where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                    select p).FirstOrDefault();
                if (lstProSelected.Contains(rs))
                {
                }
                else
                {
                    lstProSelected.Add(rs);
                    LoadlvProPromo();
                }
            }
            else if (e.CommandName == "Sel")
            {
                Response.Redirect("/Merchant/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId=" + ShpId);
            }
        }

        protected void lvPro_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvPro();
        }

        protected void lvProPromo_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField) e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
            var txtTien = (TextBox) e.Item.FindControl("txtMoney");
            var lbPrice = (Label) e.Item.FindControl("lbPrice");
            var lbPriceAfter = (Label) e.Item.FindControl("lbPriceAfter");
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
                    priceAfter = double.Parse(price) - double.Parse(price) / 100 * double.Parse(txtTien.Text);
                    lbPriceAfter.Text = priceAfter.ToFormatMoney();
                }
                else if (rdbtnPromoMode.SelectedValue == "Direct")
                {
                    priceAfter = double.Parse(price) - double.Parse(txtTien.Text);
                    lbPriceAfter.Text = priceAfter.ToFormatMoney();
                }

                if (priceAfter < 0) lbPriceAfter.Text = "0";
            }
            else if (e.CommandName == "Del")
            {
                lstProSelected.Remove(pro1);
                LoadlvProPromo();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                phdPromotion.MerExpired();
                lstProSelected.Clear();
                LoadLvPro();
            }
        }
    }
}