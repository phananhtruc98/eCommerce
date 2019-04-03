using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Rcpt_DAO : Table_DAO<Rcpt>, IRcpt
    {
        public override List<Rcpt> Filter(Func<Rcpt, bool> func)
        {
            throw new NotImplementedException();
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