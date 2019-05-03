using System;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSub_BUS : Table_BUS<RcptSub, RcptSub_DAO>, IRcptSub
    {
        private readonly Rcpt_DAO rcpt_dao = new Rcpt_DAO();

        public override bool IsExist(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptSub obj)
        {
            throw new NotImplementedException();
        }
        public override void Insert(RcptSub obj)
        {
            Rcpt rcpt = new Rcpt()
            {
                UsrAdd = obj.MerId.Value,
                IsCompleted = true
            };
            MyLibrary.Rcpt_BUS.Insert(rcpt);

            obj.RcptSubId = MyLibrary.Rcpt_BUS.GetAll().Last().RcptId;
            MyLibrary.RcptSub_BUS.Insert(obj);
        }
    }
}