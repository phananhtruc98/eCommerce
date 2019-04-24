using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptSub_DAO : Table_DAO<RcptSub>, IRcptSub
    {
        public override bool IsExist(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptSub obj)
        {
            throw new NotImplementedException();
        }
    }
}