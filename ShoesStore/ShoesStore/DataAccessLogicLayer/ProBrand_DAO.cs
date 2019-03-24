using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProBrand_DAO : IProBrand
    {
        public void Delete(ProBrand obj)
        {
          
        }

        public List<ProBrand> GetAll()
        {
            return DataProvider.Instance().ProBrand.ToList();
        }

        public ProBrand GetById(int id)
        {
            // DataProvider.Instance().ProBrand_Select(id);

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
        public ProBrand_Select_Result ProBrand_Select(int id)
        {
          return  DataProvider.Instance().ProBrand_Select(id).FirstOrDefault();

          
        }
    }
}