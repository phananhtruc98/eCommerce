using System;
using System.Collections.Generic;
using System.Linq;

namespace ShoesStore.DataAccessLogicLayer.Tables_DAO
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

        public void Insert(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<ProBrand> Filter(ProBrand obj)
        {
            throw new NotImplementedException();
        }
    }
}