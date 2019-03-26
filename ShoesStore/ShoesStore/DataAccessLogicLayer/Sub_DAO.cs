using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Sub_DAO:Table_DAO<Sub>,ISub
    {
        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }
    }
}