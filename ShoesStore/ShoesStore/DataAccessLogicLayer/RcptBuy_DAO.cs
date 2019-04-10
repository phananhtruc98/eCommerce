using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptBuy_DAO : Table_DAO<RcptBuy>, IRcptBuy
    {
        public override bool IsExist(RcptBuy obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptBuy obj)
        {
            throw new NotImplementedException();
        }
    }
}