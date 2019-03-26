using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.BusinessLogicLayer
{
    public class Usr_BUS : IUsr<Usr>
    {
        private readonly IUsr<Usr> _dao = new Usr_DAO();
        public void Delete(Usr obj)
        {
            throw new NotImplementedException();
        }

        public List<Usr> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Insert(Usr obj)
        {
            _dao.Insert(obj);
        }

        public void Update(Usr obj)
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


        public Usr Login(string login, string pwd)
        {
            return _dao.Login(login, DecryptHelper.Decrypt(pwd));
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