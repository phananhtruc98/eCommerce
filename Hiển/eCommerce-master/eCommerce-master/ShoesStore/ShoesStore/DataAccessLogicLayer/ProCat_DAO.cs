using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProCat_DAO :Table_DAO<ProCat>,IProCat
    {



        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }

        public ProCat GetById(int id)
        {
            return DataProvider.Instance.ProCat.Find(id);
        }

        public override void SetActive(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(ProCat obj)
        {
            throw new NotImplementedException();
        }
    }
}