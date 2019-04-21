using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
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

        
    }
}