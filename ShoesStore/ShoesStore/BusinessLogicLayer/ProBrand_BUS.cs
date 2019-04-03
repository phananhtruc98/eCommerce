using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProBrand_BUS :Table_DAO<ProBrand>, IProBrand
    {
        private readonly ProBrand_DAO proBrand = new ProBrand_DAO();

  

        public ProBrand GetById(int id)
        {
            throw new NotImplementedException();
        }

        public ProBrand GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public override List<ProBrand> Filter(Func<ProBrand, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(ProBrand obj)
        {
            throw new NotImplementedException();
        }
    }
}