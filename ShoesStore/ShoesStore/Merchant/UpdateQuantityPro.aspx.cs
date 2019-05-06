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
            if (!IsPostBack)
            {
                LoadLvPro();
            }
        }

        public void LoadLvPro()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == mer.MerId).Select(x => x.ShpId).FirstOrDefault();
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.ShpId == ShpId
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
                LoadlvSizeColorQty(ProId, ShpId);
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
        List<ProDet> lstProdets = new List<ProDet>();
        public void LoadlvSizeColorQty(int ProId, int ShpId)
        {
            var rs = MyLibrary.ProDet_BUS.GetAll().Where(x => x.ProId == ProId && x.ShpId == ShpId);
            lstProdets = rs.ToList();
            lvSizeColorQty.DataSource = rs.ToList();
            lvSizeColorQty.DataBind();
        }

        protected void lvSizeColorQty_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            TextBox txtQty = (TextBox)e.Item.FindControl("lbQty");
            if(e.CommandName=="Update")
            {
                var primaryKeys = e.CommandArgument.ToString().Split(',');
                int SizeId = Convert.ToInt32(primaryKeys[0]);
                int ColorId = Convert.ToInt32(primaryKeys[1]);
                int ProId = Convert.ToInt32(primaryKeys[2]);
                int ShpId = Convert.ToInt32(primaryKeys[3]);
                var rs = MyLibrary.ProDet_BUS.GetAll().Where(x => x.ProId == ProId && x.ShpId == ShpId && x.ColorId==ColorId && x.SizeId==SizeId).FirstOrDefault();
                rs.Qty = Int32.Parse(txtQty.Text);
                MyLibrary.ProDet_BUS.Update(rs);
                MyLibrary.Show("Cập nhật thành công");
                LoadLvPro();
            }
        }

        protected void lvSizeColorQty_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {

        }
    }
}