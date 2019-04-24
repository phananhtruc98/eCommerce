using System;
using ShoesStore.Interfaces;
namespace ShoesStore.DataAccessLogicLayer
{
    public class UsrAct_DAO : Table_DAO<UsrAct>, IUsrAct
    {
        public override bool IsExist(UsrAct obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(UsrAct obj)
        {
            throw new NotImplementedException();
        }
    }
}