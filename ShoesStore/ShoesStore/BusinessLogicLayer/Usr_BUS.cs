using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.BusinessLogicLayer
{
    public class Usr_BUS : Table_BUS<Usr, Usr_DAO>, IUsr<Usr>
    {
        public UsrAct_DAO _usrAct { get; set; }

        public UsrAct GetUsrAct(int usrId)
        {
            return _dao.GetUsrAct(usrId);
        }

        public Usr Login(string login, string pwd)
        {
            return _dao.Login(login, EncryptHelper.Encrypt(pwd));
        }
        public Usr GetBy(string email)
        {
            return _dao.GetBy("Email", email);
        }
        public void Register(Usr obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Usr obj)
        {
            _dao.CreateActCode(obj);
        }

        public Mstr LoginAdmin(string login, string pwd)
        {
            return _dao.CheckAdmin(login, EncryptHelper.Encrypt(pwd));
        }

        public Mer LoginMerchant(string login, string pwd)
        {
            return _dao.CheckMerchant(login, EncryptHelper.Encrypt(pwd));
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

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Usr obj)
        {
            return _dao.IsExist(obj);
        }
     
        public override void SetActive(Usr obj)
        {
            throw new NotImplementedException();
        }

        public int TotalMerCus()
        {
            var rsMer = MyLibrary.Mer_BUS.GetAll().Count;
            var rsCus = MyLibrary.Cus_BUS.GetAll().Count;
            return rsCus + rsMer;
        }
    }
}