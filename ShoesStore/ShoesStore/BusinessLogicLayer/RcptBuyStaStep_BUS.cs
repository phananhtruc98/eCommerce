using System;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyStaStep_BUS:Table_BUS<RcptBuyStaStep,RcptBuyStaStep_DAO>
    {
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