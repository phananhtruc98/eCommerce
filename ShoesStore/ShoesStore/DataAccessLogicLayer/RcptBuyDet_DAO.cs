using ShoesStore.Interfaces;
using System;
using System.Linq;
namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptBuyDet_DAO : Table_DAO<RcptBuyDet>, IRcptBuyDet
    {
        public override bool IsExist(RcptBuyDet obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(RcptBuyDet obj)
        {
            throw new NotImplementedException();
        }
        public System.Collections.Generic.List<RcptBuyDet> ListRcptBuyPreview(int RcptId)
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
    }
}