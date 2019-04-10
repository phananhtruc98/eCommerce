using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSubDet_BUS: Table_BUS<RcptSubDet_Select_Result, RcptSubDet_DAO>, IRcptSubDet
    {
    }
}