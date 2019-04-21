using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;

namespace ShoesStore.BusinessLogicLayer
{
    public class Shp_BUS : Table_BUS<Shp, Shp_DAO>, IShp
    {
        public override bool IsExist(Shp obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Shp obj)
        {
            throw new NotImplementedException();
        }
    }
}