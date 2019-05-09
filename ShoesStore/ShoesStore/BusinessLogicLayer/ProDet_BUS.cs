using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using System.Linq;
namespace ShoesStore.BusinessLogicLayer
{
    public class ProDet_BUS : Table_BUS<ProDet, ProDet_DAO>
    {
        public override bool IsExist(ProDet obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProDet obj)
        {
            throw new NotImplementedException();
        }
        public List<ProDet> GetAllBy(int ShpId, int ProId)
        {
            return GetAll().Where(pd => pd.ShpId == ShpId && pd.ProId == ProId).OrderBy(pd => pd.SizeId).ToList();
        }
        public ProDet GetBy(RcptBuyDet rcptBuyDet)
        {
            return GetAll().FirstOrDefault(pd => pd.ShpId == rcptBuyDet.ShpId && pd.ProId == rcptBuyDet.ShpId && pd.ColorId == rcptBuyDet.ColorId && pd.SizeId == rcptBuyDet.SizeId);
        }
        public bool IsOutOfStock(ProDet obj)
        {
            return (obj.Qty ?? 0) == 0;
        }
        public int ProDetLeft(ProDet obj)
        {
            return obj.Qty ?? 0;
        }

        public void ReduceProDetQty(ProDet proDet)
        {
            proDet.Qty -= (proDet.Qty > 0) ? 1 : 0;
            Update(proDet);
        }
    }
}