using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProCat_BUS : Table_BUS<ProCat, ProCat_DAO>, IProCat
    {
        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }

        public ProCat GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProCat obj)
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
            return new ProCat_BUS().GetAll().FirstOrDefault(m => catId != null && m.CatId == (int) catId).Pro.Count;
        }
    }
}