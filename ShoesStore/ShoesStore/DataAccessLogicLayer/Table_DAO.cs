using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public abstract class Table_DAO<T> : ITable<T> where T : class
    {
        public void Delete(T obj)
        {
            DataProvider.Instance().Set<T>().Attach(obj);
            DataProvider.Instance().Set<T>().Remove(obj);
            DataProvider.Instance().SaveChanges();
        }

        public List<T> GetAll()
        {
            return DataProvider.Instance().Set<T>().ToList();
        }

        public void Insert(T obj)
        {
            DataProvider.Instance().Set<T>().Add(obj);
            DataProvider.Instance().SaveChanges();

        }

        public void Update(T obj)
        {
            DataProvider.Instance().Set<T>().Attach(obj);
            DataProvider.Instance().Entry(obj).State = EntityState.Modified;
            DataProvider.Instance().SaveChanges();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<T> Filter(T obj)
        {
            throw new NotImplementedException();
        }

        public abstract bool IsExist(T obj);
    }
}