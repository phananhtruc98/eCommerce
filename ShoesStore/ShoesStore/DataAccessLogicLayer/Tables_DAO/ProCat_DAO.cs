using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace ShoesStore.DataAccessLogicLayer.Tables_DAO
{
    public class ProCat_DAO : IProCat
    {
        public List<ProCat> GetAll()
        {
            return DataProvider.Instance().ProCat.ToList();
        }

        public void Delete(ProCat obj)
        {
            DataProvider.Instance().ProCat.Attach(obj);
            DataProvider.Instance().ProCat.Remove(obj);
            DataProvider.Instance().SaveChanges();
        }

        public void Insert(ProCat obj)
        {
            DataProvider.Instance().ProCat.Add(obj);
            DataProvider.Instance().SaveChanges();

        }

        public void Update(ProCat obj)
        {
            DataProvider.Instance().ProCat.Attach(obj);
            DataProvider.Instance().Entry(obj).State = EntityState.Modified;
            DataProvider.Instance().SaveChanges();
        }

        public void SetActive()
        {
            throw new System.NotImplementedException();
        }

        public List<ProCat> Filter(ProCat obj)
        {
            throw new System.NotImplementedException();
        }

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