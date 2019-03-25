using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    internal class ProCat_BUS : IProCat_BUS
    {
        private readonly IProCat _dao = new ProCat_DAO();

        public void Delete(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> GetAll()
        {
            return _dao.GetAll();
        }

        public ProCat GetById(int id)
        {
            throw new NotImplementedException();
        }

        public ProCat Insert(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProCat obj)
        {
            throw new NotImplementedException();
        }
    }
}