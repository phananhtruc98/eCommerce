using System;
using System.Collections.Generic;
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
        public List<Pro> GetAllActive()
        {
            return GetAll().Where(m => m.Active == true && m.ProDet.Count!=0).ToList();
        }
        public int AverageStar(Pro obj)
        {
            var doub = MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => m.ShpId == obj.ShpId && m.ProId == obj.ProId)
                .Average(m => m.Point);
            return doub == null ? 0 : Convert.ToInt32(doub);
        }
        public bool IsOutOfStock(Pro obj)
        {
            return obj.ProDet.All(prodet => prodet.Qty == 0);
        }

        public int GetMaxId()
        {
            int maxId = GetAll().Max(x => x.ProId);
            return maxId;
        }
    }
}