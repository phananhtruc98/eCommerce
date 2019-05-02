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
        //trả về mảng StepId đã có của 1 thằng Hóa Đơn
        public int[] GetAllByExist(int RcptBuyId,int[] StepId)
        {
            // lấy tất cả từ RcptBuyStaDet , chỗ mà Mảng StepId có chứa các StepId của bảng đó
            // và RcptBuyId của bảng đó phải bằng với RcptBuyId đầu vào 
            // select tất cả các StepId trong bảng đưa vào mảng
            var kqCoSan = (from x in MyLibrary.RcptBuyStaDet_BUS.GetAll()
                           where  x.RcptBuyId==RcptBuyId
                           select x.StepId).ToList().ToArray();
            return kqCoSan;
        }
        //StepId.Contains(x.StepId) &&
        public RcptBuyStaStep GetMaxExist(int RcptBuyId)
        {
            var kqLonNhat = (from x in MyLibrary.RcptBuyStaDet_BUS.GetAll()
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

        internal static DataTable GetData(string v)
        {
            throw new NotImplementedException();
        }
    }
}