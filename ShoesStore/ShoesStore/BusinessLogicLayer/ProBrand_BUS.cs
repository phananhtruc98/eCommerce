using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.BusinessLogicLayer
{
    public class ProBrand_BUS : IProBrand
    {
        private IProBrand proBrand = new ProBrand_DAO();
        public void Delete(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public List<ProBrand> GetAll()
        {
            return proBrand.GetAll();
        }

        public ProBrand GetById(int id)
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