using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Rcpt_BUS : IRcpt
    {
        private Rcpt_DAO _dao = new Rcpt_DAO();
        public void Delete(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public List<Rcpt> Filter(Func<Rcpt, bool> func)
        {
            throw new NotImplementedException();
        }

        public List<Rcpt> GetAll()
        {
            return _dao.GetAll();
        }

        public void Insert(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive(Rcpt obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Rcpt obj)
        {
            throw new NotImplementedException();
        }
    }
}