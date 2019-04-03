using System;
using System.Linq;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Usr_DAO :Table_DAO<Usr>, IUsr<Usr>
    {
        public UsrAct_DAO UsrAct { get; set; }

        public Usr Login(string login, string pwd)
        {
            return GetAll().FirstOrDefault(m => m.Login == login && m.Password==pwd);
        }

        public void Register(Usr obj)
        {
            throw new NotImplementedException();
        }

        public void CreateActCode(Usr obj)
        {
            UsrAct uAct = new UsrAct()
            {
                UsrId = obj.UsrId,
                ActCode = EncryptHelper.Encrypt(obj.Login),
            };
            UsrAct=new UsrAct_DAO();
            UsrAct.Insert(uAct);
        }

        
        public Usr GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            return DataProvider.Instance.Usr.Max(m => m.UsrId);
        }

        public override void SetActive(Usr obj)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Usr obj)
        {
            throw new NotImplementedException();
        }
    }
}