using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Objects;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mer_BUS : ITable<Mer>,IMer
    {
        private readonly Mer_DAO _dao = new Mer_DAO();

        public UsrAct_DAO _usrAct { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public void CreateActCode(Mer obj)
        {
            throw new NotImplementedException();
        }

        public void Delete(Mer obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive(Mer obj)
        {
            throw new NotImplementedException();
        }

        public List<Mer> Filter(Func<Mer, bool> func)
        {
            throw new NotImplementedException();
        }

        public List<Mer> Filter(Mer obj)
        {
            throw new NotImplementedException();
        }

        public List<Mer> GetAll()
        {
            return _dao.GetAll();
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
            return _dao.Get_Mer_Info();
        }

        public void Insert(Mer obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(Mer obj)
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

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public void Update(Mer obj)
        {
            throw new NotImplementedException();
        }

  
    }
}