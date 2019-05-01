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

        public void Insert(RcptBuySta rcptBuySta, int stepId)
        {
            switch (stepId)
            {
                case 2:
                    {

                        foreach (RcptBuyDet rcptBuyDet in rcptBuySta.RcptBuy.RcptBuyDet)
                        {
                            ProDet proDet = MyLibrary.ProDet_BUS.GetBy(rcptBuyDet);
                            proDet.Qty -= (proDet.Qty - 1 >= 0) ? 1 : 0;
                            MyLibrary.ProDet_BUS.Update(proDet);
                        }
                        break;
                    }
            }
            try
            {
                var rcptBuyStaDet = new RcptBuyStaDet
                {
                    StaId = rcptBuySta.StaId,
                    RcptBuyId = rcptBuySta.RcptBuyId,
                    StepId = stepId
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