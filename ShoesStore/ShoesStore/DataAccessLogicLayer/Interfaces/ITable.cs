using System.Collections.Generic;

namespace ShoesStore.DataAccessLogicLayer.Interfaces
{
    public interface ITable<Void>
    {
        void Delete(Void obj);
        List<Void> GetAll();
        void Insert(Void obj);
        void Update(Void obj);
    }
}