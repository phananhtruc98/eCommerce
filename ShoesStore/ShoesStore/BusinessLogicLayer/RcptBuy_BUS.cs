using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using ShoesStore.Merchant;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptBuy_BUS : Table_BUS<RcptBuy, RcptBuy_DAO>, IRcptBuy
    {
        private readonly Rcpt_DAO rcpt = new Rcpt_DAO();
        private readonly RcptBuy_DAO rcptbuy_dao = new RcptBuy_DAO();

        public override bool IsExist(RcptBuy obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(RcptBuy obj)
        {
            throw new NotImplementedException();
        }

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

        public List<RcptBuy> ListRcptBuyPreview_Shop(int RcptId)
        {
            var shpIds = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptId).Select(m => m.ShpId).OrderBy(x => x)
                .Distinct().ToArray();
            var tmp = MyLibrary.RcptBuy_BUS.GetAll().Where(m => shpIds.Contains(m.ShpId) && m.RcptBuyId.Equals(RcptId))
                .ToList();
            return tmp;
        }

        public List<RcptBuy> ListRcptBuyPreview_Shop(int RcptId,int CusId)
        {
            var shpIds = MyLibrary.RcptBuyDet_BUS.ListRcptBuyPreview(RcptId, CusId).Select(m => m.ShpId).OrderBy(x => x)
                .Distinct().ToArray();
            var tmp = MyLibrary.RcptBuy_BUS.GetAll().Where(m => shpIds.Contains(m.ShpId) && m.RcptBuyId.Equals(RcptId))
                .ToList();
            return tmp;
        }

        public List<RcptBuy> ListRcptBuyPreview_Rcpt(int CusId)
        {
            var RcptId = MyLibrary.RcptBuyDet_BUS.ListRcptBuyDet_Ìmg().Select(m => m.RcptBuyId).OrderBy(x => x)
                .Distinct().ToArray();
            var tmp = MyLibrary.RcptBuy_BUS.GetAll().Where(m => RcptId.Contains(m.RcptBuyId) && m.CusId.Equals(CusId))
                .OrderByDescending(x => x.Rcpt.DateAdd).ToList();
            return tmp;
        }
        public double SumPrice(RcptBuy rcptBuy)
        {
            return rcptBuy.RcptBuyDet.Sum(m => Convert.ToInt32(m.ProDet.Pro.Price));
        }

        /// <summary>
        /// Reduce all RcptBuy's ProDet's Qty
        /// </summary>
        /// <param name="rcptBuy"></param>
        public void ReduceProQtyOfRcptBuy(RcptBuy rcptBuy)
        {
            foreach (RcptBuyDet rcptBuyDet in rcptBuy.RcptBuyDet)
            {
                MyLibrary.ProDet_BUS.ReduceProDetQty(rcptBuyDet.ProDet);
            }
        }


        
    }
}