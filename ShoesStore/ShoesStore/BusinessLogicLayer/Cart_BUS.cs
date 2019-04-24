using System;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Cart_BUS : Table_BUS<Cart, Cart_DAO>, ICart
    {
        public override bool IsExist(Cart obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Cart obj)
        {
            throw new NotImplementedException();
        }

        public Cart GetMyCart()
        {
            var cus = WebSession.LoginCus;
            return MyLibrary.Cart_BUS.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
        }
    }
}