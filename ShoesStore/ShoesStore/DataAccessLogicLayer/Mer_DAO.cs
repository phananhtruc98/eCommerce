using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Mer_DAO : Table_DAO<Mer>, IMer
    {
        public void CreateActCode(Mer obj)
        {  
            throw new NotImplementedException();
        }
        
        public Mer GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public Mer Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public void Register(Mer obj)
        {
            throw new NotImplementedException();
        }
    }
}