using System;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.BusinessLogicLayer
{
    public class Pro_BUS : Table_BUS<Pro, Pro_DAO>
    {
        public override bool IsExist(Pro obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(Pro obj)
        {
            throw new NotImplementedException();
        }
        public int AverageStar(Pro obj)
        {
            double? doub = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.ShpId == obj.ShpId && m.ProId == obj.ProId)
                .Average(m => m.Point);
            return doub==null?0:Convert.ToInt32(doub);
        }
    }
}