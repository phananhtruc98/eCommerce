using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class UsrAct_DAO:Table_DAO<UsrAct>,IUsrAct
    {
        public override void SetActive(UsrAct obj)
        {
            throw new System.NotImplementedException();
        }

        public override bool IsExist(UsrAct obj)
        {
            throw new NotImplementedException();
        }
    }
}