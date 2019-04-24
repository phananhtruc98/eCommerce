using System;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Rcpt_DAO : Table_DAO<Rcpt>, IRcpt
    {
        public override bool IsExist(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public int getMaxRcptId()
        {
            var result = (from rcpt in GetAll()
                select rcpt.RcptId).Max();
            var maxRcptId = result;
            return maxRcptId;
        }
    }
}