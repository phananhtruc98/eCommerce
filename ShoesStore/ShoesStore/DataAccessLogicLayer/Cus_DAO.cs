using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Cus_DAO :Table_DAO<Cus>, ICus
    {
        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            return GetAll().Max(m => m.CusId);
        }


        public UsrAct_DAO _usrAct { get; set; }

        public Cus Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public void Register(Cus obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Cus obj)
        {
            throw new NotImplementedException();
        }

        public bool IsValidUser(Cus obj)
        {
            throw new NotImplementedException();
        }

        public ICart iCart { get; set; }
        public void AddCart(Pro pro)
        {
          
        }

        public void Buy(ICart icart)
        {
            throw new NotImplementedException();
        }

        public void ActCode()
        {
            throw new NotImplementedException();
        }

        public bool IsActCode()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Cus obj)
        {
            throw new NotImplementedException();
        }
    }
}