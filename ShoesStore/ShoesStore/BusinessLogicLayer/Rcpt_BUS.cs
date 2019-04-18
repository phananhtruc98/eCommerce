using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Rcpt_BUS : Table_BUS<Rcpt, Rcpt_DAO>, IRcpt
    {
        
        public int getMaxRcptId()
        {
           return _dao.getMaxRcptId();
        }

        public override bool IsExist(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Rcpt obj)
        {
            throw new NotImplementedException();
        }
    }
}