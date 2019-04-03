using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Sub_DAO:Table_DAO<Sub>,ISub
    {     
        public int GetLastestId()
        {
            throw new NotImplementedException();
            
        }

        public override void SetActive(Sub obj)
        {
            throw new NotImplementedException();
        }

        public override List<Sub> Filter(Func<Sub, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Sub obj)
        {
            throw new NotImplementedException();
        }
    }
}