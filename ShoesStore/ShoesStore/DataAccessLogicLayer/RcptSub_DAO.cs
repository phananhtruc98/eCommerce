using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptSub_DAO : Table_DAO<RcptSub>, IRcptSub
    {
        public override List<RcptSub> Filter(Func<RcptSub, bool> func)
        {
            throw new NotImplementedException();
        }

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