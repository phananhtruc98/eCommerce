using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Sub_BUS : ITable<Sub>,ISub
    {
        private readonly Sub_DAO _dao = new Sub_DAO();

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
             _dao.Delete(obj);
        }

        public List<Sub> GetAll()
        {
            return _dao.GetAll();
        }

        void ITable<Sub>.Insert(Sub obj)
        {
            throw new NotImplementedException();
        }

        public void Insert(Sub obj)
        {
            _dao.Insert(obj);
        }

        public void Update(Sub obj)
        {
            _dao.Update(obj);
        }

        public void SetActive(Sub obj)
        {
            throw new NotImplementedException();
        }

        public List<Sub> Filter(Func<Sub, bool> func)
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

        public bool IsExist(Sub obj)
        {
            throw new NotImplementedException();
        }
    }
}