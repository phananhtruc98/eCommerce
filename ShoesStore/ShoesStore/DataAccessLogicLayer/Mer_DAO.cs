using System;
using System.Data.Objects;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Mer_DAO : Table_DAO<Mer>, IMer
    {
        public UsrAct_DAO UsrAct
        {
            get => throw new NotImplementedException();
            set => throw new NotImplementedException();
        }

        public void CreateActCode(Mer obj)
        {
            DataProvider.Instance.sp_Mer_Info();
        }

        public UsrAct GetUsrAct(int usrId)
        {
            throw new NotImplementedException();
        }

        public Mer Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public void Register(Mer obj)
        {
            throw new NotImplementedException();
        }

        ObjectResult<sp_Mer_Info_Result> IMer.Get_Mer_Info()
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Mer_Info_Result> Get_Mer_Info()
        {
            return DataProvider.Instance.sp_Mer_Info();
        }

        public Mer GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Mer obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Mer obj)
        {
            throw new NotImplementedException();
        }
    }
}