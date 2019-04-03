using System;
using System.Collections.Generic;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Cart_DAO:Table_DAO<Cart>,ICart
    {
   

        public override void SetActive(Cart obj)
        {
            throw new NotImplementedException();
        }

        public override List<Cart> Filter(Func<Cart, bool> func)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Cart obj)
        {
            throw new NotImplementedException();
        }
    }
}