using System.Collections.Generic;
using System.Data;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProCat_DAO :Table_DAO<ProCat>,IProCat
    {



        public List<ProCat> GetPopularProCats(int n)
        {
            throw new System.NotImplementedException();
        }

        public ProCat GetById(int id)
        {
            return DataProvider.Instance().ProCat.Find(id);
        }
    }
}