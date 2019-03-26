using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class UsrAct_DAO:Table_DAO<UsrAct>,IUsrAct
    {
        public override bool IsExist(UsrAct obj)
        {
            throw new NotImplementedException();
        }
    }
}