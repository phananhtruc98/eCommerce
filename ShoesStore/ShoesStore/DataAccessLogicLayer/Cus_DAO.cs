using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using ShoesStore.Interfaces;
using ShoesStore.MyExtensions;

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

        public override void SetActive(Cus obj)
        {
            throw new NotImplementedException();
        }

        public override List<Cus> Filter(Func<Cus, bool> func)
        {
            return ProExtension.Filter(GetAll(), func);
        }

        public override bool IsExist(Cus obj)
        {
            throw new NotImplementedException();
        }


        public ObjectResult<Cus_Info_Result> Get_Cus_Info()
        {
            return DataProvider.Instance.Cus_Info();
        }
    }
}