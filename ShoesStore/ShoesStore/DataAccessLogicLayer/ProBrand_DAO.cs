using System;
using System.Collections.Generic;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProBrand_DAO : IProBrand
    {
        public List<ProBrand> GetAll()
        {
            return DataProvider.Instance().ProBrand.ToList();
        }

        public void Delete(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public ProBrand GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public ProBrand Insert(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProBrand obj)
        {
            throw new NotImplementedException();
        }
    }
}