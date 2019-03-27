using System;
using System.Collections.Generic;

namespace ShoesStore.Interfaces
{
    public interface ITable<T>
    {
        void Delete(T obj);
        List<T> GetAll();
        void Insert(T obj);
        void Update(T obj);
        void SetActive(T obj);
        List<T> Filter(Func<T, bool> func);
        bool IsExist(T obj);
    }

}