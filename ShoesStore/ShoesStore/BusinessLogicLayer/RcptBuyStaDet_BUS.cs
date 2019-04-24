using System;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyStaDet_BUS : Table_BUS<RcptBuyStaDet, RcptBuyStaDet_DAO>
    {
        public override bool IsExist(RcptBuyStaDet obj)
        {
            throw new NotImplementedException();
        }

        public void Insert(RcptBuySta rcptBuySta, int stepid)
        {
            try
            {
                var rcptBuyStaDet = new RcptBuyStaDet
                {
                    StaId = rcptBuySta.StaId,
                    RcptBuyId = rcptBuySta.RcptBuyId,
                    StepId = stepid
                };
                Insert(rcptBuyStaDet);
            }
            catch (Exception ex)
            {
            }
        }

        public override void SetActive(RcptBuyStaDet obj)
        {
            throw new NotImplementedException();
        }
    }
}