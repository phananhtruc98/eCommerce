using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProCat_BUS : Table_BUS<ProCat,ProCat_DAO>,IProCat
    {
        private readonly ProCat_DAO _dao = new ProCat_DAO();

        

        public ProCat GetById(int id)
        {
            throw new NotImplementedException();
        }

      
        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<ProCat> Filter(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }
    }
}