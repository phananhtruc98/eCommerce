using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace ShoesStore.DataAccessLogicLayer.Tables_DAO
{
    public class WebInfo_DAO : IWebInfo
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

        public void Insert(WebInfo obj)
        {
            DataProvider.Instance().WebInfo.Add(obj);
            DataProvider.Instance().SaveChanges();
            
        }

        public void Update(WebInfo obj)
        {
            DataProvider.Instance().WebInfo.Attach(obj);
            DataProvider.Instance().Entry(obj).State = EntityState.Modified;
            DataProvider.Instance().SaveChanges();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<WebInfo> Filter(WebInfo obj)
        {
            throw new NotImplementedException();
        }

        public List<WebSlide> GetSlides()
        {
            throw new NotImplementedException();
        }

        public WebInfo GetById(int id)
        {
            return DataProvider.Instance().WebInfo.Find(id);
        }
    }
}