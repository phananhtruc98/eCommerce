using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    internal interface IPro : ITable<Pro>
    {
        List<Pro> FindByName(string name);
        List<Pro> FindByPrice(string priceFrom, string priceTo);
        Pro GetByPrimaryKeys(int shpId, int proId);
    }
}