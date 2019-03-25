using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Sub_DAO:ISub
    {
        public void Delete(Sub obj)
        {
            DataProvider.Instance().Sub.Remove(obj);
            DataProvider.Instance().SaveChanges();
        }
        public List<Sub> GetAll()
        {
            return DataProvider.Instance().Sub.ToList();
        }

        public void Insert(Sub obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Sub obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Sub> Filter(Sub obj)
        {
            throw new NotImplementedException();
        }

        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }
    }
}