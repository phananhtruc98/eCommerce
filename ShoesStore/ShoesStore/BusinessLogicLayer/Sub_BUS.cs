using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Sub_BUS : ITable<Sub>
    {
        private readonly ITable<Sub> sub = new Sub_DAO();

        public Sub GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public void Delete(Sub obj)
        {
            throw new NotImplementedException();
        }

        public List<Sub> GetAll()
        {
            throw new NotImplementedException();
        }

        void ITable<Sub>.Insert(Sub obj)
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

        public bool IsExist(Sub obj)
        {
            throw new NotImplementedException();
        }
    }
}