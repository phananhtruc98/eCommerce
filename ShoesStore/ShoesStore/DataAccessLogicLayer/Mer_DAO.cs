using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Objects;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Mer_DAO : Table_DAO<Mer>, IMer
    {
        public UsrAct_DAO _usrAct { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        
        

        public void CreateActCode(Mer obj)
        {

            DataProvider.Instance.Mer_Info();
        }
        
        public Mer GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public ObjectResult<Mer_Info_Result> Get_Mer_Info()
        {
            return DataProvider.Instance.Mer_Info();
        }

        public override void SetActive(Mer obj)
        {
            throw new NotImplementedException();
        }

        public override List<Mer> Filter(Func<Mer, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Mer obj)
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

   
    }
}