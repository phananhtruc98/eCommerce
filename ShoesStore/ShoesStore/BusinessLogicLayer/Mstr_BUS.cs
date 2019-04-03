using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mstr_BUS : ITable<Mstr>, IMstr
    {
        private readonly Mstr_DAO _dao = new Mstr_DAO();
        public UsrAct_DAO _usrAct { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public void CreateActCode(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public void Delete(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public void Delete(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public List<Mstr> Filter(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public List<IMstr> Filter(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public List<Mstr> Filter(Func<Mstr, bool> func)
        {
            throw new NotImplementedException();
        }

        public List<Mstr> GetAll()
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
            return _dao.Get_Admin_Info();
        }

        public void Insert(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public void Insert(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(IMstr obj)
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

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public void SetActive(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public void Update(IMstr obj)
        {
            throw new NotImplementedException();
        }

  
    }
}