using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSub_BUS : Table_BUS<RcptSub, RcptSub_DAO>, IRcptSub
    {
        private readonly RcptSub_DAO _dao = new RcptSub_DAO();
        private readonly Rcpt_DAO rcpt_dao = new Rcpt_DAO();

        public List<RcptSub> GetAll_Join_Rcpt()
        {
            List<RcptSub> rcptSub_lst = new List<RcptSub>();
            var result = rcpt_dao.GetAll()
                .Join(_dao.GetAll(), r => r.RcptId,
                s => s.RcptSubId, (rcpt, rcptSub) =>
                new
                {
                    rcptSub.RcptSubId,
                    rcpt.DateAdd,
                    rcpt.DateEdit,
                    rcpt.UsrAdd,
                    rcpt.UsrEdit
                });

            foreach (var a in result)
            {
                RcptSub ob = new RcptSub()
                {
                    RcptSubId = a.RcptSubId,
                    Rcpt = new Rcpt()
                    {
                        RcptId = a.RcptSubId,
                        DateAdd = a.DateAdd,
                        DateEdit = a.DateEdit,
                        UsrAdd = a.UsrAdd,
                        UsrEdit = a.UsrEdit
                    }
                };
                rcptSub_lst.Add(ob);
            }
            return rcptSub_lst;
        }


    }
}