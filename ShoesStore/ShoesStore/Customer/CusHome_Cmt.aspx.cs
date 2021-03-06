﻿using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Customer
{
    public partial class CusHome_Cmt : Page
    {
        private readonly Pro_BUS pro_BUS = new Pro_BUS();
        private readonly ProColor_BUS proColor_BUS = new ProColor_BUS();
        private readonly ProSize_BUS proSize_BUS = new ProSize_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Shp_BUS shp_BUS = new Shp_BUS();

        public void BindDataListview(int CusId)
        {
            var rs = from d in rcptBuyDet.GetAll()
                join r in rcptBuy.GetAll() on d.RcptBuyId equals r.RcptBuyId
                join s in shp_BUS.GetAll() on d.ShpId equals s.ShpId
                join p in pro_BUS.GetAll() on d.ProId equals p.ProId
                join c in proColor_BUS.GetAll() on d.ColorId equals c.ColorId
                join z in proSize_BUS.GetAll() on d.SizeId equals z.SizeId
                where r.CusId == CusId && d.Cmt != null
                select new
                {
                    s.ShpName,
                    p.ProName,
                    c.ColorName,
                    z.SizeName,
                    d.Cmt,
                    d.Point
                };
            var rs1 = from a in rs.ToList()
                group a by new {a.ShpName, a.ProName, a.ColorName, a.SizeName, a.Cmt, a.Point}
                into t
                select new
                {
                    t.Key.ShpName,
                    t.Key.ProName,
                    t.Key.ColorName,
                    t.Key.SizeName,
                    t.Key.Cmt,
                    t.Key.Point
                };
            if (rs1.Count() == 0)
            {
                lbEmpty.Visible = true;
            }
            else
            {
                ListView1.DataSource = rs1;
                ListView1.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var usr = (Usr) WebSession.LoginUsr;
            var usr1 = Master._usr.GetAll().FirstOrDefault(m => m.UsrId == usr.UsrId);
            BindDataListview(usr1.UsrId);
        }
    }
}