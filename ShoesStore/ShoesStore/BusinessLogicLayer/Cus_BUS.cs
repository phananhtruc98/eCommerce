using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Cus_BUS:ICus
    {
        private readonly ITable<Cus> _dao = new Cus_DAO();
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

        public bool IsExist(Cus obj)
        {
            return _dao.IsExist(obj);
        }

        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public UsrAct_DAO _usrAct { get; set; }

        public void Login(string username, string password)
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

        public ICart iCart { get; set; }

        public void AddCart(Pro pro)
        {
            throw new NotImplementedException();
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

        Cus IUsr<Cus>.Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }
    }
}