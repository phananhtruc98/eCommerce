using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyDet_BUS : Table_BUS<RcptBuyDet, RcptBuyDet_DAO>, IRcptBuyDet
    {
    }
}