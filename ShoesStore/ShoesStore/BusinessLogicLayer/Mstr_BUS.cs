using System;
using System.Collections.Generic;
using System.Data.Objects;

using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mstr_BUS : Table_BUS<Mstr, Mstr_DAO>, IMstr
    {
        public UsrAct_DAO UsrAct
        {
            get => throw new NotImplementedException();
            set => throw new NotImplementedException();
        }

        public void CreateActCode(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Admin_Info_Result> Get_Admin_Info()
        {
            return _dao.Get_Admin_Info();
        }

        public UsrAct GetUsrAct(int usrId)
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

        public IMstr GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public void Insert(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public void Update(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public void getColumnsToSort(string ColName)
        {
            MyExtensions.MyExtensions.SortBy(Get_Admin_Info().AsQueryable(), ColName);
        }

        public override bool IsExist(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Mstr obj)
        {
            throw new NotImplementedException();
        }

        System.Data.Objects.ObjectResult<sp_Admin_Info_Result> IMstr.Get_Admin_Info()
        {
            throw new NotImplementedException();
        }
    }
}