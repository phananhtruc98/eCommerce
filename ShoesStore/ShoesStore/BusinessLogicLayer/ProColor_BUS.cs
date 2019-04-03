using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProColor_BUS : ITable<ProColor>
    {
        private readonly ProColor_DAO _dao = new ProColor_DAO();
        public void Delete(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public List<ProColor> Filter(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public List<ProColor> Filter(Func<ProColor, bool> func)
        {
            throw new NotImplementedException();
        }

        public List<ProColor> GetAll()
        {
            return _dao.GetAll();
        }

        public void Insert(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public void SetActive(ProColor obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProColor obj)
        {
            throw new NotImplementedException();
        }
    }
}