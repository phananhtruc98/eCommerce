using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ShoesStore.Customer
{
    public partial class CusHome_Cmt : System.Web.UI.Page
    {
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly Shp_BUS shp_BUS = new Shp_BUS();
        private readonly Pro_BUS pro_BUS = new Pro_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usr usr = (Usr)WebSession.LoginUsr;
            Usr usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            BindDataListview(usr1.UsrId);
            
        }

        public void BindDataListview(int CusId)
        {
            var rs = from d in rcptBuyDet.GetAll()
                     join r in rcptBuy.GetAll() on d.RcptBuyId equals r.RcptBuyId
                     join s in shp_BUS.GetAll() on d.ShpId equals s.ShpId
                     join p in pro_BUS.GetAll() on d.ProId equals p.ProId
                     where r.CusId == CusId
                     select new
                     {
                         ShpName = s.ShpName,
                         ProName = p.ProName,
                         Cmt = d.Cmt,
                         Point = d.Point,
                         DateAdd = d.DateAdd
                     };
            ListView1.DataSource = rs;
            ListView1.DataBind();
        }
    }
}