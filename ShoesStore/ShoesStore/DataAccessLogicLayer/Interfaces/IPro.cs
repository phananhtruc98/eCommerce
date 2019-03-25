using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoesStore.DataAccessLogicLayer.Interfaces
{
    interface IPro:ITable<Pro>
    {
        Pro GetByPrimaryKeys(int shpId,int proId);
        List<Pro> FindByName(string name);
        List<Pro> FindByPrice(string priceFrom, string priceTo);



    }
}
