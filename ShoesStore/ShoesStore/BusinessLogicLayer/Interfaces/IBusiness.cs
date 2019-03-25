using System.Collections.Generic;

namespace ShoesStore.BusinessLogicLayer
{
    public interface IBusiness<T, IdT>
    {
        void Delete(T obj);
        List<T> GetAll();
        T GetById(IdT id);
        T Insert(T obj);
        void Update(T obj);
    }
}