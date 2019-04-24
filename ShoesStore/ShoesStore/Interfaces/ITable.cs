using System.Collections.Generic;
namespace ShoesStore.Interfaces
{
    public interface ITable<T>
    {
        void Delete(T obj);
        List<T> GetAll();
        void Insert(T obj);
        void Update(T obj);
        bool IsExist(T obj);
        void SetActive(T obj);
    }
}