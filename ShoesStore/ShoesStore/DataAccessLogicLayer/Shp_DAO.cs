using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Shp_DAO : Table_DAO<Shp>, IShp
    {
        public List<Shp> GetAll()
        {
            return GetAll();
        }

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