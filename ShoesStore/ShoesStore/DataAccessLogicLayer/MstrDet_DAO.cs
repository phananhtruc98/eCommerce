using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class MstrDet_DAO : Table_DAO<MstrDet>, IMstrDet
    {
        public override bool IsExist(MstrDet obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(MstrDet obj)
        {
            throw new NotImplementedException();
        }
    }
}