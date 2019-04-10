using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptSubDet_DAO : Table_DAO<RcptSubDet_Select_Result>, IRcptSubDet
    {
        public override bool IsExist(RcptSubDet_Select_Result obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptSubDet_Select_Result obj)
        {
            throw new NotImplementedException();
        }
    }
}