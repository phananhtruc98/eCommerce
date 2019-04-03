using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Objects;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Mstr_DAO : Table_DAO<Mstr>, IMstr
    {
        public UsrAct_DAO _usrAct { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public void CreateActCode(IMstr obj)
        {
            throw new NotImplementedException();
            
        }

        public void Delete(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public List<IMstr> Filter(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public IMstr GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public ObjectResult<Admin_Info_Result> Get_Admin_Info()
        {
            return DataProvider.Instance.Admin_Info();
        }

        public void Insert(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public override List<Mstr> Filter(Func<Mstr, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public IMstr Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public void Register(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public void Update(IMstr obj)
        {
            throw new NotImplementedException();
        }

 
    }
}