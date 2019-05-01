using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuyStaDet_BUS : Table_BUS<RcptBuyStaDet, RcptBuyStaDet_DAO>
    {
        public override bool IsExist(RcptBuyStaDet obj)
        {
            throw new NotImplementedException();
        }
        public int[] GetAllByExist(int RcptBuyId,int[] StepId)
        {
            var kqCoSan = (from x in GetAll()
                           where StepId.Contains(x.StepId) && x.RcptBuyId==RcptBuyId
                           select x.StepId).ToList().ToArray();
            return kqCoSan;
        }
        public RcptBuyStaStep GetMaxExist(int RcptBuyId)
        {
            var kqLonNhat = (from x in GetAll()
                           where  x.RcptBuyId == RcptBuyId
                           orderby x.StepId descending
                           select x.StepId ).Take(1).FirstOrDefault();
            RcptBuyStaStep kq = GetRcptBuyStaStep(kqLonNhat);
            return kq;
        }
        public RcptBuyStaStep GetRcptBuyStaStep(int StepId)
        {


            var kqBuoc = (from x in MyLibrary.RcptBuyStaStep_BUS.GetAll()
                           where  x.StepId == StepId
                           select x).ToList().FirstOrDefault();
            return kqBuoc;
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

        internal static DataTable GetData(string v)
        {
            throw new NotImplementedException();
        }
    }
}