using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoesStore.DataAccessLogicLayer.Interfaces
{
    interface IUsr<T>:ITableOnePrimary<T>
    {
        
        void Register(T obj);

    }
}
