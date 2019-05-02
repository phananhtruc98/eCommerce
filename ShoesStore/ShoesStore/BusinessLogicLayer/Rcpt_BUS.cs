using System;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Rcpt_BUS : Table_BUS<Rcpt, Rcpt_DAO>, IRcpt
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
            return _dao.getMaxRcptId();
        }

        public int TotalRcpt()
        {
            var rs = MyLibrary.Rcpt_BUS.GetAll().Count;
            return rs;
        }
    }
}