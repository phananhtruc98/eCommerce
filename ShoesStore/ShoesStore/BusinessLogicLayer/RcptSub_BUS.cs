using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSub_BUS : IRcptSub
    {
        private readonly RcptSub_DAO _dao = new RcptSub_DAO();
        private readonly Rcpt_DAO rcpt_dao = new Rcpt_DAO();
        public void Delete(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public List<RcptSub> Filter(Func<RcptSub, bool> func)
        {
            throw new NotImplementedException();
        }

        public List<RcptSub> GetAll()
        {
            List<RcptSub> rcptSub_lst = new List<RcptSub>();
            var  result = rcpt_dao.GetAll()
                .Join(_dao.GetAll(), r => r.RcptId,
                s => s.RcptSubId, (rcpt, rcptSub) =>
                new
                {
                    RcptSubId = rcptSub.RcptSubId,
                    DateAdd = rcpt.DateAdd,
                    DateEdit = rcpt.DateEdit,
                    UsrAdd = rcpt.UsrAdd,
                    UsrEdit = rcpt.UsrEdit
                });
            
            foreach(var a in result)
            {
                RcptSub ob = new RcptSub()
                {
                    RcptSubId=a.RcptSubId,
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

        public void Insert(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public bool IsExist(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive(RcptSub obj)
        {
            throw new NotImplementedException();
        }

        public void Update(RcptSub obj)
        {
            throw new NotImplementedException();
        }
    }
}