using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuySta_BUS : Table_BUS<RcptBuySta, RcptBuySta_DAO>
    {
        public RcptBuySta GetLast()
        {
            return GetAll().LastOrDefault();


        }
        public override bool IsExist(RcptBuySta obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptBuySta obj)
        {
            throw new NotImplementedException();
        }
    }
}