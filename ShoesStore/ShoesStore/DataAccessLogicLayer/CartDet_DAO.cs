using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.DataAccessLogicLayer
{
    public class CartDet_DAO:Table_DAO<CartDet>
    {
        public override void SetActive(CartDet obj)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(CartDet obj)
        {
            throw new NotImplementedException();
        }
    }
}