using System;
using System.Linq;
namespace ShoesStore.DataAccessLogicLayer
{
    public class CartDet_DAO : Table_DAO<CartDet>
    {
        public override void SetActive(CartDet obj)
        {
            throw new NotImplementedException();
        }
        public override bool IsExist(CartDet obj)
        {
            return GetAll().Any(m =>
                m.CartId == obj.CartId && m.ShpId == obj.ShpId && m.ProId == obj.ProId && m.ColorId == obj.ColorId &&
                m.SizeId == obj.SizeId);
        }
    }
}