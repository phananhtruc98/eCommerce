using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class ManageRcptSub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadlvRcptSub();
            }
        }

        public void LoadlvRcptSub()
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var rs = MyLibrary.RcptSub_BUS.ListRcptSubPreview_Rcpt(mer.MerId);
            //int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == ).Select(x => x.ShpId).FirstOrDefault();
            //var rs = (from r in MyLibrary.RcptSub_BUS.GetAll()
            //          where r.MerId == mer.MerId
            //          select r).ToList();
            var rs1 = from r in rs
                      join s in MyLibrary.RcptSubDet_BUS.GetAll() on r.RcptSubId equals s.RcptSubId
                      select r;
            if (rs.Count != 0)
            {
                lvRcptSub.DataSource = rs;
                lvRcptSub.DataBind();
            }
            else { lbEmpty.Visible = true; }
        }
        protected void lvRcptSub_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            
        }

        protected void lvRcptSub_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadlvRcptSub();
        }

        protected void lvRcptSub_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var hdfRcptSubId = (HiddenField)e.Item.FindControl("hdfRcptSubId");
                var RcptSubId = int.Parse(hdfRcptSubId.Value);
                var lvRcptSubDet = (ListView)e.Item.FindControl("lvEachSub");
                lvRcptSubDet.DataSource = MyLibrary.RcptSubDet_BUS.ListRcptBuyDet_SubContent()
                    .Where(m => m.RcptSubId + "" == hdfRcptSubId.Value);
                lvRcptSubDet.DataBind();
            }
        }
    }
}