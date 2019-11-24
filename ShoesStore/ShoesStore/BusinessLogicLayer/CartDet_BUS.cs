using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class CartDet_BUS : Table_BUS<CartDet, CartDet_DAO>
    {
        private readonly Cart_BUS _cartBus = new Cart_BUS();
        private readonly Cus_BUS _cusBus = new Cus_BUS();

        public override bool IsExist(CartDet obj)
        {
            return _dao.IsExist(obj);
        }

        public List<CartDet> ListCartPreview()
        {
            try
            {
                var cus = _cusBus.GetAll().FirstOrDefault(m => m.CusId == (WebSession.LoginUsr as Usr)?.UsrId);
                var cart = _cartBus.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
                if (cart == null && cus != null)
                {
                    cart = new Cart { CusId = cus.CusId };
                    _cartBus.Insert(cart);
                    cart = _cartBus.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
                }

                return GetAll().Where(m => cart != null && m.CartId == cart.CartId).ToList();
            }
            catch
            {
                return null;
            }
        }

        public List<Shp> ListCartPreview_Shop()
        {
            var shpIds = ListCartPreview().Select(m => m.ShpId).OrderBy(x => x).Distinct().ToArray();
            return MyLibrary.Shp_Bus.GetAll().Where(m => shpIds.Contains(m.ShpId)).ToList();
        }

        public int ListCartPreviewNumber()
        {
            if (ListCartPreview() != null && ListCartPreview().Count > 0)
                return ListCartPreview().GroupBy(m => new { m.ProDet.Pro.ShpId, m.ProDet.Pro.ProId }).Count();
            return 0;
        }

        public override void SetActive(CartDet obj)
        {
            _dao.SetActive(obj);
        }

        public string SumCartDetPrice()
        {
            if (WebSession.LoginCus == null) return "0";
            try
            {
                var money = GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId)
                    .Sum(m => double.Parse(MyLibrary.Pro_BUS.GetPrice(m.ProDet.Pro)) * m.Qty);
                return money.ToString();
            }
            catch (Exception)
            {
                return "0";
            }
        }

        public string SumCartDetPrice_Shop(int shpId)
        {
            try
            {
                var money = GetAll()
                    .Where(m => m.ProDet.Pro.ShpId == shpId && m.Cart.CusId == WebSession.LoginCus.CusId)
                    .Sum(m => Convert.ToInt32(MyLibrary.Pro_BUS.GetPrice(m.ProDet.Pro)) * m.Qty);
                var s = GetAll().Where(m => m.ProDet.Pro.ShpId == shpId && m.Cart.CusId == WebSession.LoginCus.CusId);
                return money.ToString();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return "0";
            }
        }

        public string SumCartDetPriceNoDiscount()
        {
            if (WebSession.LoginCus == null) return "0";
            try
            {
                var money = GetAll().Where(n => n.Cart.CusId == WebSession.LoginCus.CusId)
                    .Sum(m => double.Parse(m.ProDet.Pro.Price) * m.Qty);
                return money.ToString();
            }
            catch (Exception)
            {
                return "0";
            }
        }
    }
}