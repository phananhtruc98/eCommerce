using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class CartDet_BUS:Table_BUS<CartDet,CartDet_DAO>
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
            int? money = GetAll().Sum(m => Convert.ToInt32(m.ProDet.Pro.Price)*m.Qty);
            return money.ToString();
        }
    }
}