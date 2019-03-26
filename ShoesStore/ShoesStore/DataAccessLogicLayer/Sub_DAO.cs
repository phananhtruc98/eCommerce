using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Sub_DAO:Table_DAO<Sub>,ISub
    {     
        public int GetLastestId()
        {
            throw new NotImplementedException();
        }
    }
}