using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class MstrRole_DAO : Table_DAO<MstrRole>, IMstrRole
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