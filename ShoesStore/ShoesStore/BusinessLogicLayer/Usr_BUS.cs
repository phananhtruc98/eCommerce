using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.BusinessLogicLayer
{
    public class Usr_BUS : IUsr<Usr>,ITableOnePrimary<Usr>
    {
        private readonly Usr_DAO _dao = new Usr_DAO();
        public void Delete(Usr obj)
        {
            _dao.Delete(obj);
        }

        public List<Usr> GetAll()
        {
            return _dao.GetAll();
        }

        public void Insert(Usr obj)
        {
            _dao.Insert(obj);
        }

        public void Update(Usr obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive(Usr obj)
        {
            throw new NotImplementedException();
        }

        public List<Usr> Filter(Func<Usr, bool> func)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Usr> Filter(Usr obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(Usr obj)
        {
            return _dao.IsExist(obj);
        }

        public Usr GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            return _dao.GetLastestId();
        }


        public UsrAct_DAO _usrAct { get; set; }

        public Usr Login(string login, string pwd)
        {
            return _dao.Login(login, EncryptHelper.Encrypt(pwd));
        }

        public void Register(Usr obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Usr obj)
        {
            _dao.CreateActCode(obj);
        }
    }
}