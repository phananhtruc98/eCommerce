﻿using System;
using System.Collections.Generic;
using System.Data.Objects;
using ShoesStore.Interfaces;
namespace ShoesStore.DataAccessLogicLayer
{
    public class Mstr_DAO : Table_DAO<Mstr>, IMstr
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
            return DataProvider.Instance.sp_Admin_Info();
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

        public override bool IsExist(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Mstr obj)
        {
            throw new NotImplementedException();
        }

        public void Update(IMstr obj)
        {
            throw new NotImplementedException();
        }

        public void getColumsToSort(string ColName)
        {
        }

        System.Data.Objects.ObjectResult<sp_Admin_Info_Result> IMstr.Get_Admin_Info()
        {
            throw new NotImplementedException();
        }
    }
}