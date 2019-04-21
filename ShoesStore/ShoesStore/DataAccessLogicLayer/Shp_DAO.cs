using ShoesStore.Interfaces;
using System;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Shp_DAO : Table_DAO<Shp>, IShp
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