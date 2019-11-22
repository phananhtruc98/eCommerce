using System;
using System.Data.Objects;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Cus_DAO : Table_DAO<Cus>, ICus
    {
        public UsrAct_DAO UsrAct { get; set; }

        public UsrAct GetUsrAct(int usrId)
        {
            throw new NotImplementedException();
        }

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

        ObjectResult<sp_Cus_Info_Result> ICus.Get_Cus_Info()
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Cus_Info_Result> Get_Cus_Info()
        {
            return DataProvider.Instance.sp_Cus_Info();
        }

        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            return GetAll().Max(m => m.CusId);
        }

        public override bool IsExist(Cus obj)
        {
            throw new NotImplementedException();
        }

        public bool IsValidUser(Cus obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Cus obj)
        {
            throw new NotImplementedException();
        }
    }
}