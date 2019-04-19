using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class CartDet_BUS : Table_BUS<CartDet, CartDet_DAO>
    {
        public override bool IsExist(CartDet obj)
        {
            return _dao.IsExist(obj);
        }

        public override void SetActive(CartDet obj)
        {
            _dao.SetActive(obj);
        }

        public string SumCartDetPrice()
        {
            try
            {
                int? money = GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId).Sum(m => Convert.ToInt32(m.ProDet.Pro.Price) * m.Qty);
                return money.ToString();
            }
            catch (Exception e)
            {
                return "0";
            }


        }

        public string SumCartDetPrice_Shop(int shpId)
        {
            try
            {
                int? money = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.Cart.CusId == WebSession.LoginCus.CusId)
                    .Sum(m => Convert.ToInt32(m.ProDet.Pro.Price) * m.Qty);
                var s = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.Cart.CusId == WebSession.LoginCus.CusId);
                return money.ToString();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return "0";
            }
       
        }
    }
}