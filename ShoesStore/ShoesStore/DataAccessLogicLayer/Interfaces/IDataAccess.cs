using System.Collections.Generic;

namespace ShoesStore.DataAccessLogicLayer
{
    public interface IDataAccess<T>
    {
        void Delete(T obj);
        List<T> GetAll();
        T GetByPrimaryKeys(int id);
        T Insert(T obj);
        void Update(T obj);
    }
}