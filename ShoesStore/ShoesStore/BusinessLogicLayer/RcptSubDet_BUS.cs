using System;
using System.Collections.Generic;
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

        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            return _dao.SelectedRowById(RcptSubId);
        }

// Hàm này lấy id của merchant đang đăng nhập bỏ vô RcptSubId
        public RcptSubDet GetMyRcptSubDet()
        {
            var mer = MerchantSession.LoginMer;
//return MyLibrary.RcptSubDet_BUS.GetAll().FirstOrDefault(m => mer != null && m.MerId == mer.MerId);
            return null; //xoa di
        }
    }
}