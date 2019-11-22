using System;
using System.Linq;

namespace ShoesStore.DataAccessLogicLayer
{
    public class CartDet_DAO : Table_DAO<CartDet>
    {
        public override bool IsExist(CartDet obj)
        {
            try
            {
                return GetAll().Any(m =>
                    m.CartId == obj.CartId && m.ShpId == obj.ShpId && m.ProId == obj.ProId &&
                    m.ColorId == obj.ColorId &&
                    m.SizeId == obj.SizeId);
            }
            catch
            {
                return false;
            }
        }

        public override void SetActive(CartDet obj)
        {
            throw new NotImplementedException();
        }
    }
}