using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    internal interface IPro : ITable<Pro>
    {
        Pro GetByPrimaryKeys(int shpId, int proId);
        List<Pro> FindByName(string name);
        List<Pro> FindByPrice(string priceFrom, string priceTo);
    }
}