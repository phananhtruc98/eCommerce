using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ShoesStore.DataAccessLogicLayer
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

        public ProCat GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public ProCat GetById(int id)
        {
            return DataProvider.Instance().ProCat.Find(id);
        }

        public ProCat Insert(ProCat obj)
        {
            DataProvider.Instance().ProCat.Add(obj);
            DataProvider.Instance().SaveChanges();
            return obj;
        }

        public void Update(ProCat obj)
        {
            DataProvider.Instance().ProCat.Attach(obj);
            DataProvider.Instance().Entry(obj).State = EntityState.Modified;
            DataProvider.Instance().SaveChanges();
        }
    }
}
