using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public abstract class Table_BUS<T, U> : ITable<T> where T : class where U : Table_DAO<T>, new()
    {
        protected readonly U _dao = new U();

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

        public abstract bool IsExist(T obj);

        public abstract void SetActive(T obj);
    }
}