using System;
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
    }
}