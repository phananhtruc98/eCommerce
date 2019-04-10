using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Sub_BUS : Table_BUS<Sub, Sub_DAO>, ISub
    {
        private readonly Sub_DAO _dao = new Sub_DAO();

        public List<Sub> Filter(Sub obj)
        {
            throw new NotImplementedException();
        }

        public Sub GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Sub GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }


        public void SetActive()
        {
            throw new NotImplementedException();
        }
    }
}