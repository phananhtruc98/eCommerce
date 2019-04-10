using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.BusinessLogicLayer
{
    public class Usr_BUS : Table_BUS<Usr, Usr_DAO>, IUsr<Usr>
    {
        private readonly Usr_DAO _dao = new Usr_DAO();

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Usr> Filter(Usr obj)
        {
            throw new NotImplementedException();
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

        public UsrAct GetUsrAct(int usrId)
        {
            return _dao.GetUsrAct(usrId);
        }

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