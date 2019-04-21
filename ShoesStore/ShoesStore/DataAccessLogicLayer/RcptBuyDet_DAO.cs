using ShoesStore.Interfaces;
using System;

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
    }
}