using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

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
        public List<Pro> GetAllActive()
        {
            return GetAll().Where(m => m.Active == true && m.ProDet.Count != 0).ToList();
        }
        public int AverageStar(Pro obj)
        {
            var doub = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.ShpId == obj.ShpId && m.ProId == obj.ProId)
                .Average(m => m.Point);
            return doub == null ? 0 : Convert.ToInt32(doub);
        }
        public bool IsOutOfStock(Pro obj)
        {
            return obj.ProDet.All(prodet => (prodet.Qty ?? 0) == 0);
        }

        public bool IsAllowComment(Pro obj)
        {
            return MyLibrary.RcptBuyDet_BUS.GetCommentLeft(obj) == 0 ? false : true;
        }
        public List<ProColor> GetAvailableColors(Pro obj)
        {

            List<ProDet> listProDet = obj.ProDet.ToList();

            var results = MyLibrary.ProColor_BUS.GetAll().Join(listProDet,
  proColor => proColor.ColorId,
  proDet => proDet.ColorId,
  (proColor, proDet) => proColor
).Distinct();
            return results.ToList();
        }
        public int GetMaxId()
        {
            int maxId = GetAll().Max(x => x.ProId);
            return maxId;
        }
    }
}