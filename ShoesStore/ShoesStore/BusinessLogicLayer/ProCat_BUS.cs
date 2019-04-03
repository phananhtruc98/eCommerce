using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProCat_BUS : ITable<ProCat>,IProCat
    {
        private readonly ProCat_DAO _dao = new ProCat_DAO();

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

        public void SetActive(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> Filter(Func<ProCat, bool> func)
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

        public bool IsExist(ProCat obj)
        {
            throw new NotImplementedException();
        }

        public List<ProCat> GetPopularProCats(int n)
        {
            throw new NotImplementedException();
        }
    }
}