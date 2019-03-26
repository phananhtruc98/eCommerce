using System.Collections.Generic;

namespace ShoesStore.Interfaces
{
    public interface ITable<T>
    {
        void Delete(T obj);
        List<T> GetAll();
        void Insert(T obj);
        void Update(T obj);
        void SetActive();
        List<T> Filter(T obj);
        bool IsExist(T obj);
    }
}