using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuy_BUS : Table_BUS<RcptBuy, RcptBuy_DAO>, IRcptBuy
    {
        private readonly Rcpt_DAO rcpt = new Rcpt_DAO();
        private readonly RcptBuy_DAO rcptbuy_dao = new RcptBuy_DAO();

        public List<RcptBuy> GetAll_Join_Rcpt()
        {
            var rcptBuy_lst = new List<RcptBuy>();
            var result = rcpt.GetAll()
                .Join(rcptbuy_dao.GetAll(), r => r.RcptId,
                    s => s.RcptBuyId, (rcpt, rcptBuy) =>
                        new
                        {
                            rcptBuy.RcptBuyId,
                            rcpt.DateAdd,
                            rcpt.DateEdit,
                            rcpt.UsrAdd,
                            rcpt.UsrEdit,
                            rcptBuy.CusId
                        });
            foreach (var a in result)
            {
                var ob = new RcptBuy
                {
                    RcptBuyId = a.RcptBuyId,
                    CusId = a.CusId,
                    Rcpt = new Rcpt
                    {
                        RcptId = a.RcptBuyId,
                        DateAdd = a.DateAdd,
                        DateEdit = a.DateEdit,
                        UsrAdd = a.UsrAdd,
                        UsrEdit = a.UsrEdit
                    }
                };
                rcptBuy_lst.Add(ob);
            }

            return rcptBuy_lst;
        }

        public override bool IsExist(RcptBuy obj)
        {
            throw new System.NotImplementedException();
        }

        public override void SetActive(RcptBuy obj)
        {
            throw new System.NotImplementedException();
        }
    }
}