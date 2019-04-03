using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;

namespace ShoesStore.BusinessLogicLayer
{
    public class ProColor_BUS :Table_BUS<ProColor,ProColor_DAO>,IProColor
    {
        private readonly ProColor_DAO _dao = new ProColor_DAO();
       

        public List<ProColor> Filter(ProColor obj)
        {
            throw new NotImplementedException();
        }

    
     

        public void SetActive()
        {
            throw new NotImplementedException();
        }

    }
}