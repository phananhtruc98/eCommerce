using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSubDet_BUS: Table_BUS<RcptSubDet, RcptSubDet_DAO>, IRcptSubDet
    {
        
        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            return _dao.SelectedRowById(RcptSubId);

        }
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
            Mer mer = ShoesStore.Merchant.MerchantSession.LoginMer;
            return MyLibrary.RcptSubDet_BUS.GetAll().FirstOrDefault(m => mer != null && m.MerId == mer.MerId);
        }
    }
}