using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Sub_BUS : ISub
    {
        private readonly ISub sub = new Sub_DAO();
        public void Delete(Sub obj)
        {
            sub.Delete(obj);
        }

        public List<Sub> GetAll()
        {
            return sub.GetAll();
        }

        void ITable<Sub>.Insert(Sub obj)
        {
            throw new NotImplementedException();
        }

        public Sub GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public void Insert(Sub obj)
        {
            sub.Insert(obj);
        }

        public void Update(Sub obj)
        {
            sub.Update(obj);
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Sub> Filter(Sub obj)
        {
            throw new NotImplementedException();
        }
    }
}