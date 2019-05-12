using System;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;
using System.Linq;

using System.Collections.Generic;

namespace ShoesStore.BusinessLogicLayer
{
    public class Shp_BUS : Table_BUS<Shp, Shp_DAO>
    {
        public override bool IsExist(Shp obj)
        {
            throw new NotImplementedException();

        }

        public override void SetActive(Shp obj)
        {
            throw new NotImplementedException();
        }

        public string ShpUrl(Shp obj)
        {
            return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + $"/{TextHelper.UrlFriendly(obj.ShpName)}";
        }

        public int CountRcptBuy(Shp shp)
        {
            var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.ShpId == shp.ShpId).ToList();
            return rcptBuy.Count();
        }

        public int CountRcptBuySuccess(Shp shp)
        {
            List<RcptBuyStaDet> lstRcptBuyDet = new List<RcptBuyStaDet>();
            var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.ShpId == shp.ShpId).ToList();
            foreach (RcptBuy item in rcptBuy)
            {
                if (SuccessStep(item.RcptBuyId) != null)
                {
                    lstRcptBuyDet.Add(SuccessStep(item.RcptBuyId));
                }
            }
            return lstRcptBuyDet.Count;
        }


        public RcptBuyStaDet SuccessStep(int RcptId)
        {
            var rs = MyLibrary.RcptBuyStaDet_BUS.GetAll().Where(x => x.RcptBuyId == RcptId).ToList();
            //var rs1 = rs.Max(x => x.StepId);
            var rs2 = rs.Where(x => x.StepId == 7).FirstOrDefault();
            return rs2;
        }


        public int CountRcptBuySuccess(Shp shp, int month, int year)
        {
            List<RcptBuyStaDet> lstRcptBuyDet = new List<RcptBuyStaDet>();
            var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.ShpId == shp.ShpId).ToList();
            foreach (RcptBuy item in rcptBuy)
            {
                if (SuccessStep(item.RcptBuyId, month, year) != null)
                {
                    lstRcptBuyDet.Add(SuccessStep(item.RcptBuyId, month, year));
                }
            }
            return lstRcptBuyDet.Count;
        }

        public RcptBuyStaDet SuccessStep(int RcptId, int month, int year)
        {
            //var rs = MyLibrary.RcptBuyStaDet_BUS.GetAll().Where(x => x.RcptBuyId == RcptId && x.AddDate.Value.Month == month && x.AddDate.Value.Year == year).ToList();
            var rs = (from rd in MyLibrary.RcptBuyStaDet_BUS.GetAll()
                      join r in MyLibrary.Rcpt_BUS.GetAll() on rd.RcptBuyId equals r.RcptId
                      where rd.RcptBuyId == RcptId & r.DateAdd.Month == month && r.DateAdd.Year == year
                      select rd).ToList();
            var rs2 = rs.Where(x => x.StepId == 7).FirstOrDefault();
            return rs2;
        }


        public int CountRcptBuySuccess(Shp shp, int year)
        {
            List<RcptBuyStaDet> lstRcptBuyDet = new List<RcptBuyStaDet>();
            var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.ShpId == shp.ShpId).ToList();
            foreach (RcptBuy item in rcptBuy)
            {
                if (SuccessStep(item.RcptBuyId, year) != null)
                {
                    lstRcptBuyDet.Add(SuccessStep(item.RcptBuyId, year));
                }
            }
            return lstRcptBuyDet.Count;
        }

        public RcptBuyStaDet SuccessStep(int RcptId, int year)
        {
            //var rs = MyLibrary.RcptBuyStaDet_BUS.GetAll().Where(x => x.RcptBuyId == RcptId && x.AddDate.Value.Month == month && x.AddDate.Value.Year == year).ToList();
            var rs = (from rd in MyLibrary.RcptBuyStaDet_BUS.GetAll()
                      join r in MyLibrary.Rcpt_BUS.GetAll() on rd.RcptBuyId equals r.RcptId
                      where rd.RcptBuyId == RcptId && r.DateAdd.Year == year
                      select rd).ToList();
            var rs2 = rs.Where(x => x.StepId == 7).FirstOrDefault();
            return rs2;
        }

        public Shp GetShp(string shpNameUrlCode)
        {

            return GetAll().FirstOrDefault(m => TextHelper.UrlFriendly(m.ShpName) == shpNameUrlCode);

        }


        //public double ShopMoney(Shp shp)
        //{
        //    return shp.RcptBuy
        //        .Where(rcptBuy => rcptBuy.RcptBuySta
        //            .Any(rcptBuySta => rcptBuySta.RcptBuyStaDet
        //                .Any(rcptBuyStaDet => rcptBuyStaDet.StepId == 7)))
        //        .Sum(rcptBuy => rcptBuy.RcptBuyDet
        //            .Sum(rcptBuyDet => int.Parse(MyLibrary.Pro_BUS.GetPrice(rcptBuyDet.ProDet.Pro))));
        //}
        public int AverageStar(Shp obj)
        {
            try
            {


                var doub = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.RcptBuy.ShpId == obj.ShpId)
                    .Where(m => m.RcptBuy.CusPoint != null)
                    .Average(m => m.RcptBuy.CusPoint);
                return doub == null ? 0 : System.Convert.ToInt32(doub);
            }

            catch
            {
                return 0;
            }
        }
    }
}