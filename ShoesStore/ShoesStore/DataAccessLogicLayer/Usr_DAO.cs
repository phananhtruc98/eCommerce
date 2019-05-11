using System;
using System.Linq;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Usr_DAO : Table_DAO<Usr>, IUsr<Usr>
    {
        private readonly Mer_DAO _mer_DAO = new Mer_DAO();
        private readonly Mstr_DAO _mstr_DAO = new Mstr_DAO();
        private UsrAct_DAO _usrAct_DAO = new UsrAct_DAO();

        public UsrAct GetUsrAct(int usrId)
        {
            return _usrAct_DAO.GetAll().FirstOrDefault(m => m.UsrId == usrId);
        }

        public Usr Login(string login, string pwd)
        {
            var v = GetAll();
            return GetAll().FirstOrDefault(m => m.Login == login && (m.Password == pwd || m.PasswordForget ==pwd));
            return null;
        }

        public void Register(Usr obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Usr obj)
        {
            var uAct = new UsrAct
            {
                UsrId = obj.UsrId,
                ActCode = EncryptHelper.Encrypt(obj.Login)
            };
            _usrAct_DAO = new UsrAct_DAO();
            _usrAct_DAO.Insert(uAct);
        }

        public Usr GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            return DataProvider.Instance.Usr.Max(m => m.UsrId);
        }

        public override bool IsExist(Usr obj)
        {
            return GetAll().FirstOrDefault(m => m.Login == obj.Login) == null ? false : true;
        }

        public override void SetActive(Usr obj)
        {
            throw new NotImplementedException();
        }

        public Mer CheckMerchant(string login, string pwd)
        {
            var usr = Login(login, pwd);
            // tu day tro xuong kt
            var usrId = usr.UsrId;
            var rs = _mer_DAO.GetAll().FirstOrDefault(m => m.MerId == usrId);
            if (rs != null)
                return rs;
            return null;
        }
        public Mstr CheckAdmin(string login, string pwd)
        {
            var usr = Login(login, pwd);
            // tu day tro xuong kt
            var usrId = usr.UsrId;
            var rs = _mstr_DAO.GetAll().FirstOrDefault(m => m.MstrId == usrId);
            if (rs != null)
                return rs;
            return null;
        }

        public Usr GetBy(string ColumnName, string value)
        {
            return GetAll().FirstOrDefault(usr => usr.GetType().GetProperty(ColumnName).GetValue(usr)!=null && usr.GetType().GetProperty(ColumnName).GetValue(usr).ToString() == value);
        }

    }
}