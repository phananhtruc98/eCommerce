using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.DynamicData;

namespace ShoesStore.DataAccessLogicLayer.Interfaces
{
    interface ITableOnePrimary<T>:ITable<T>
    {
        T GetByPrimaryKeys(int id);
    }
}
