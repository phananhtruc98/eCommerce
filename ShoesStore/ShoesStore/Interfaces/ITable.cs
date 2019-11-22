using System.Collections.Generic;

namespace ShoesStore.Interfaces
{
    public interface ITable<T>
    {
        void Delete(T obj);
        List<T> GetAll();
        T GetLast();
        void Insert(T obj);
        bool IsExist(T obj);
        void SetActive(T obj);
        void Update(T obj);
    }
}