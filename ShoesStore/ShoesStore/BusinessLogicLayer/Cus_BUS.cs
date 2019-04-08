﻿using System;
using System.Collections.Generic;
using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Cus_BUS:Table_BUS<Cus,Cus_DAO>,ICus
    {
        private readonly Cus_DAO _dao = new Cus_DAO();
        
        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<Cus> Filter(Cus obj)
        {
            throw new NotImplementedException();
        }
        
        public Cus GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public UsrAct_DAO UsrAct { get; set; }

        public UsrAct GetUsrAct(int usrId)
        {
            throw new NotImplementedException();
        }

        public void Login(string username, string password)
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
            throw new NotImplementedException();
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

        Cus IUsr<Cus>.Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public ObjectResult<Cus_Info_Result> Get_Cus_Info()
        {
            return _dao.Get_Cus_Info();
        }
    }
}