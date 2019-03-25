using ShoesStore.DataAccessLogicLayer;
using ShoesStore.DataAccessLogicLayer.Tables_DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Sub_BUS : ISub_BUS
    {
        private readonly ISub sub = new Sub_DAO();
        public void Delete(Sub obj)
        {
            sub.Delete(obj);
        }

        public List<Sub> GetAll()
        {
            return sub.GetAll();
        }

        public Sub GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public Sub Insert(Sub obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Sub obj)
        {
            throw new NotImplementedException();
        }
    }
}