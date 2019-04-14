using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProCat_BUS : Table_BUS<ProCat, ProCat_DAO>, IProCat
    {
        private readonly ProCat_DAO _dao = new ProCat_DAO();
        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }
        public List<ProCat> Filter(ProCat obj)
        {
            throw new NotImplementedException();
        }
        public ProCat GetById(int id)
        {
            throw new NotImplementedException();
        }
        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public static int GetTotalPro(object catId)
        {
            return new ProCat_BUS().GetAll().FirstOrDefault(m=>catId != null && m.CatId==(int)catId).Pro.Count;
        }

        public ProCat GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }
    }
}