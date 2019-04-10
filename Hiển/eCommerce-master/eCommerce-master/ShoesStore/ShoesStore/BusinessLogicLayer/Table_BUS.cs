using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Table_BUS<T, U> : ITable<T> where T : class where U : Table_DAO<T>, new()
    {
        private readonly U _dao = new U();
        public void Delete(T obj)
        {
            _dao.Delete(obj);
        }

        public List<T> GetAll()
        {
            return _dao.GetAll();
        }

        public void Insert(T obj)
        {
            _dao.Insert(obj);
        }

        public void Update(T obj)
        {
            _dao.Update(obj);
        }

        public bool IsExist(T obj)
        {
            return _dao.IsExist(obj);
        }

        public void SetActive(T obj)
        {
            throw new NotImplementedException();
        }
    }
}