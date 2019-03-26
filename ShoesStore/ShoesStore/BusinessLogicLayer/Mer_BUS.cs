using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mer_BUS : ITable<Mer>
    {
        private readonly Mer_DAO _dao = new Mer_DAO();
        public void Delete(Mer obj)
        {
            throw new NotImplementedException();
        }

        public List<Mer> Filter(Mer obj)
        {
            throw new NotImplementedException();
        }

        public List<Mer> GetAll()
        {
            return _dao.GetAll();
        }

        public void Insert(Mer obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(Mer obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public void Update(Mer obj)
        {
            throw new NotImplementedException();
        }
    }
}