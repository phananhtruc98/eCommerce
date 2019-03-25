using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer.Interfaces;

namespace ShoesStore.DataAccessLogicLayer.Tables_DAO
{
    public class Cus_DAO : ICus
    {
        public void Delete(Cus obj)
        {
            throw new NotImplementedException();
        }

        public List<Cus> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Insert(Cus obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Cus obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Cus> Filter(Cus obj)
        {
            throw new NotImplementedException();
        }

        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public void Login(string username, string password)
        {
            throw new NotImplementedException();
        }

        public void Register(Cus obj)
        {
            throw new NotImplementedException();
        }

        public ICart iCart { get; set; }
        public void AddCart(Pro pro)
        {
            throw new NotImplementedException();
        }

        public void Buy(ICart icart)
        {
            throw new NotImplementedException();
        }
    }
}