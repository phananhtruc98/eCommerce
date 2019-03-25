using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoesStore.DataAccessLogicLayer
{
    public interface IDataAccess<T>
    {
        List<T> GetAll();
        void Delete(T obj);
        T GetByPrimaryKeys(int id);
        T Insert(T obj);
        void Update(T obj);
    }
}
