using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.DataAccessLogicLayer.Interfaces;
using ShoesStore.DataAccessLogicLayer.Tables_DAO;

namespace ShoesStore.BusinessLogicLayer.Tables_BUS
{
    public class ProCat_BUS : IProCat
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

        void ITable<ProCat>.Insert(ProCat obj)
        {
            throw new NotImplementedException();
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

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<ProCat> Filter(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }
    }
}