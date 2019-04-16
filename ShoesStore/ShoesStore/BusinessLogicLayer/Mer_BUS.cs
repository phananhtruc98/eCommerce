using System;
using System.Collections.Generic;
using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mer_BUS : Table_BUS<Mer, Mer_DAO>, IMer
    {
        private readonly Mer_DAO _dao = new Mer_DAO();

        public UsrAct_DAO UsrAct
        {
            get => throw new NotImplementedException();
            set => throw new NotImplementedException();
        }

        public void CreateActCode(Mer obj)
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Mer_Info_Result> Get_Mer_Info()
        {
            return _dao.Get_Mer_Info();
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


        public List<Mer> Filter(Mer obj)
        {
            throw new NotImplementedException();
        }


        public Mer GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public void SetActive()
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