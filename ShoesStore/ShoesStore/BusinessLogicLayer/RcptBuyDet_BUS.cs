using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

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

        public int GetNumberReview(Pro iPro)
        {
            try
            {
                return GetProComments(iPro).Count();
            }
            catch
            {
                return 0;
            }
        }
        public List<RcptBuyDet> GetAllBy(Pro iPro, Cus iCus)
        {
            return GetAll().Where(m => m.ShpId == iPro.ShpId && m.ProId == iPro.ProId && !string.IsNullOrEmpty(m.Cmt) && m.RcptBuy.CusId == iCus.CusId).ToList();
        }
        public int GetCommentLeft(Pro iPro)
        {

            int[] allowCommentSteps = MyLibrary.GetAllowCommentStepIds();
            Cus cus = WebSession.LoginCus;
            if (cus != null)
            {
                var rcptBuyDetNotCommented = GetAllBy(iPro, cus);
                var rcptBuyStaDet = MyLibrary.RcptBuyStaDet_BUS.GetAll();
                return rcptBuyStaDet.Join(rcptBuyDetNotCommented,
                    a => a.RcptBuyId,
                    b => b.RcptBuyId,
                    (a, b) => a).Count(a => allowCommentSteps.Contains(a.StepId));
            }
            return 0;

        }

        public IEnumerable<RcptBuyDet> GetProComments(Pro iPro)
        {
            return GetAll().Where(m => m.ShpId == iPro.ShpId && m.ProId == iPro.ProId && !string.IsNullOrEmpty(m.Cmt));
        }

        public List<RcptBuyDet> ListRcptBuyPreview(int RcptId)
        {
            try
            {
                var cus = MyLibrary.Cus_BUS.GetAll()
                    .FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
                var rcptBuyDet = MyLibrary.RcptBuyDet_BUS.GetAll()
                    .FirstOrDefault(m => cus != null && m.RcptBuyId == RcptId);
                return MyLibrary.RcptBuyDet_BUS.GetAll()
                    .Where(m => rcptBuyDet != null && m.RcptBuyId == rcptBuyDet.RcptBuyId).ToList();
            }
            catch
            {
                return null;
            }
        }

        public List<RcptBuyDet> ListRcptBuyPreview(int RcptId, int CusId)
        {
            try
            {
                var cus = MyLibrary.Cus_BUS.GetAll()
                    .FirstOrDefault(m => m.CusId == CusId);
                var rcptBuyDet = MyLibrary.RcptBuyDet_BUS.GetAll()
                    .FirstOrDefault(m => cus != null && m.RcptBuyId == RcptId);
                return MyLibrary.RcptBuyDet_BUS.GetAll()
                    .Where(m => rcptBuyDet != null && m.RcptBuyId == rcptBuyDet.RcptBuyId).ToList();
            }
            catch
            {
                return null;
            }
        }

        public List<RcptBuyDet> ListRcptBuyDet_Ìmg()
        {
            var cus = MyLibrary.Cus_BUS.GetAll().FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
            //RcptBuy rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
            var rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().Where(m => m.CusId == cus.CusId).ToList();
            return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuy != null && rcptBuy.Contains(m.RcptBuy))
                .ToList();
            //return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuy != null && m.RcptBuyId == rcptBuy.RcptBuyId).ToList();
        }

        public string SumRcptBuyPrice_Shop(int shpId)
        {
            var money = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.RcptBuy.CusId == WebSession.LoginCus.CusId)
                .Sum(m => Convert.ToInt32(m.ProDet.Pro.Price) * m.Quantity);
            var s = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.RcptBuy.CusId == WebSession.LoginCus.CusId);
            return money.ToString();
        }
    }
}