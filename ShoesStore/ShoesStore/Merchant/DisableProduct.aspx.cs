using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class DisableProduct : Page
    {
        public static List<Pro> lsOutOfStock = new List<Pro>();

        protected void lbtnIsOutOfStock_Click(object sender, EventArgs e)
        {
            foreach (var pro in lsOutOfStock)
            {
                var rs = MyLibrary.Pro_BUS.GetAll().Where(x => x.ProId == pro.ProId).FirstOrDefault();
                rs.IsOutOfStock = !rs.IsOutOfStock;
                MyLibrary.Pro_BUS.Update(rs);
            }

            MyLibrary.Show("Cập nhật thành công!");
            LoadLvPro();
            LoadOutofStockPro();
            lsOutOfStock.Clear();
            
        }

        public void LoadLvPro()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId)
                .FirstOrDefault();
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.ShpId == ShpId
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

        public void LoadOutofStockPro()
        {
            if (lsOutOfStock.Count == 0)
            {
                lbEmpty2.Visible = true;
            }
            else
            {
                lvOutofStock.DataSource = lsOutOfStock;
                lvOutofStock.DataBind();
            }
        }

        protected void lvOutofStock_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
        }

        protected void lvOutofStock_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager2.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvPro();
        }

        protected void lvPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                lbtnIsOutOfStock.Visible = true;
                var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                          where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                          select p).FirstOrDefault();
                if (lsOutOfStock.Contains(rs))
                {
                    MyLibrary.Show("Sản phẩm này đã được chọn");
                }
                else
                {
                    lsOutOfStock.Add(rs);
                    LoadOutofStockPro();
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lsOutOfStock.Clear();
                if (lsOutOfStock.Count == 0) lbEmpty2.Visible = true;
                LoadLvPro();
            }
        }
    }
}