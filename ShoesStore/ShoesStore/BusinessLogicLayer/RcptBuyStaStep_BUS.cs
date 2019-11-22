using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyStaStep_BUS : Table_BUS<RcptBuyStaStep, RcptBuyStaStep_DAO>
    {
        public List<RcptBuyStaStep> GetAllBy(int[] StepId)
        {
            var kq = (from x in GetAll()
                where StepId.Contains(x.StepId)
                select x).ToList();
            return kq;
        }

        public override bool IsExist(RcptBuyStaStep obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptBuyStaStep obj)
        {
            throw new NotImplementedException();
        }
    }
}