using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using ShoesStore.Merchant;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSubDet_BUS : Table_BUS<RcptSubDet, RcptSubDet_DAO>, IRcptSubDet
    {
        public override bool IsExist(RcptSubDet obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptSubDet obj)
        {
            throw new NotImplementedException();
        }

// Hàm này lấy id của merchant đang đăng nhập bỏ vô RcptSubId
        public RcptSubDet GetMyRcptSubDet()
        {
            var mer = MerchantSession.LoginMer;
            //return MyLibrary.RcptSubDet_BUS.GetAll().FirstOrDefault(m => mer != null && m.MerId == mer.MerId);
            return null; //xoa di
        }

        public List<RcptSubDet> ListRcptBuyDet_SubContent()
        {
            var mer = MyLibrary.Mer_BUS.GetAll()
                .FirstOrDefault(m => m.MerId == (MerchantSession.LoginMerchant as Mer)?.MerId);
            //RcptBuy rcptBuy = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => cus != null && m.CusId == cus.CusId);
            var rcptSub = MyLibrary.RcptSub_BUS.GetAll().Where(m => m.MerId == mer.MerId).ToList();
            return MyLibrary.RcptSubDet_BUS.GetAll().Where(m => rcptSub != null && rcptSub.Contains(m.RcptSub))
                .ToList();
            //return MyLibrary.RcptBuyDet_BUS.GetAll().Where(m => rcptBuy != null && m.RcptBuyId == rcptBuy.RcptBuyId).ToList();
        }

        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            return _dao.SelectedRowById(RcptSubId);
        }

        public string TotalPrice()
        {
            var rs = (from sd in MyLibrary.RcptSubDet_BUS.GetAll()
                join sb in MyLibrary.Sub_BUS.GetAll() on sd.SubId equals sb.SubId
                select new
                {
                    Price = int.Parse(sb.Price) * sd.Quantity
                }).Sum(x => x.Price);
            return rs.ToString();
        }
    }
}