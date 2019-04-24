using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyDet_BUS : Table_BUS<RcptBuyDet, RcptBuyDet_DAO>, IRcptBuyDet
    {
        public override bool IsExist(RcptBuyDet obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(RcptBuyDet obj)
        {
            throw new NotImplementedException();
        }
        public int GetNumberReview(int ShpId, int ProId)
        {
            return GetAll().Count(m => m.ShpId == ShpId && m.ProId == ProId);
        }
        public int GetCommentLeft(Pro iPro)
        {
            var v = GetAll().ToList().Where(m =>
             m.ShpId == iPro.ShpId && m.ProId == iPro.ProId && !string.IsNullOrEmpty(m.Cmt));
            return v.Count();
        }
        public IEnumerable<RcptBuyDet> GetProComments(Pro iPro)
        {
            return GetAll().Where(m => m.ShpId == iPro.ShpId && m.ProId == iPro.ProId && !string.IsNullOrEmpty(m.Cmt));
        }
        public List<RcptBuyDet> ListRcptBuyPreview(int RcptId)
        {
            try
            {
                Cus cus = MyLibrary.Cus_BUS.GetAll().FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
                RcptBuyDet rcptBuyDet = MyLibrary.RcptBuyDet_BUS.GetAll().FirstOrDefault(m => cus != null && m.RcptBuyId == RcptId);
                return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuyDet != null && m.RcptBuyId == rcptBuyDet.RcptBuyId).ToList();
            }
            catch
            {
                return null;
            }
        }
        public List<RcptBuyDet> ListRcptBuyDet_Ìmg()
        {
            Cus cus = MyLibrary.Cus_BUS.GetAll().FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
            //RcptBuy rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
            List<RcptBuy> rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(m => m.CusId == cus.CusId).ToList();
            return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuy != null && rcptBuy.Contains(m.RcptBuy)).ToList();
            //return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuy != null && m.RcptBuyId == rcptBuy.RcptBuyId).ToList();
        }
        public string SumRcptBuyPrice_Shop(int shpId)
        {
            int? money = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.RcptBuy.CusId == WebSession.LoginCus.CusId)
                        .Sum(m => Convert.ToInt32(m.ProDet.Pro.Price) * m.Quantity);
            var s = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.RcptBuy.CusId == WebSession.LoginCus.CusId);
            return money.ToString();
        }
    }
}