using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class UpdateQuantityPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadLvPro();
            }
        }

        public void LoadLvPro()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId).FirstOrDefault();
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.IsOutOfStock == true && p.ShpId == ShpId
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
                //lbtnIsOutOfStock.Visible = true;
                //var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                //          where p.ProId == ProId && p.ShpId == ShpId && p.Active == true
                //          select p).FirstOrDefault();
                //if (lsOutOfStock.Contains(rs))
                //{ MyLibrary.Show("Sản phẩm này đã được chọn"); }
                //else
                //{
                //    lsOutOfStock.Add(rs);
                //    LoadOutofStockPro();
                //}
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
    }
}