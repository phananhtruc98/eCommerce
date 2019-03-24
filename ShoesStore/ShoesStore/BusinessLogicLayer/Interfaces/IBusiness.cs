using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ShoesStore.BusinessLogicLayer
{
    public interface IBusiness<T, IdT>
    {
        List<T> GetAll();
        void Delete(T obj);
        T GetById(IdT id);
        T Insert(T obj);
        void Update(T obj);
    }
}
