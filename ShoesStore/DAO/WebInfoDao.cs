using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO.Interfaces;
using DTO;

namespace DAO
{
    public class WebInfoDao : IWebInfo
    {
        public List<WebInfo> GetAll()
        {
            return DataProvider.Instance().WebInfo.ToList();
        }

        public void Delete(WebInfo obj)
        {
            DataProvider.Instance().WebInfo.Attach(obj);
            DataProvider.Instance().WebInfo.Remove(obj);
            DataProvider.Instance().SaveChanges();
        }

        public WebInfo GetById(int id)
        {
            return DataProvider.Instance().WebInfo.Find(id);
        }

        public WebInfo Insert(WebInfo obj)
        {
            DataProvider.Instance().WebInfo.Add(obj);
            DataProvider.Instance().SaveChanges();
            return obj;
        }

        public void Update(WebInfo obj)
        {
            DataProvider.Instance().WebInfo.Attach(obj);
            DataProvider.Instance().Entry(obj).State = EntityState.Modified;
            DataProvider.Instance().SaveChanges();
        }
    }
}
