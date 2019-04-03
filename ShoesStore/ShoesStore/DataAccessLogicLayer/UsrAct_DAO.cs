using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class UsrAct_DAO:Table_DAO<UsrAct>,IUsrAct
    {
        public override void SetActive(UsrAct obj)
        {
            throw new NotImplementedException();
        }

        public override List<UsrAct> Filter(Func<UsrAct, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(UsrAct obj)
        {
            throw new NotImplementedException();
        }
    }
}