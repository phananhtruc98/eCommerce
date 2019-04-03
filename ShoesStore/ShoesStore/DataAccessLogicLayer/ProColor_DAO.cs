using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProColor_DAO : Table_DAO<ProColor>, IProColor
    {
        public override bool IsExist(ProColor obj)
        {
            throw new NotImplementedException();
        }
    }
}