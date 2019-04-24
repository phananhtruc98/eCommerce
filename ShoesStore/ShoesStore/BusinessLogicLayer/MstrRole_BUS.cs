using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
namespace ShoesStore.BusinessLogicLayer
{
    public class MstrRole_BUS : Table_BUS<MstrRole, MstrRole_DAO>, IMstrRole
    {
        public override bool IsExist(MstrRole obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(MstrRole obj)
        {
            throw new NotImplementedException();
        }
    }
}