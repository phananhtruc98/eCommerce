using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;

namespace ShoesStore.BusinessLogicLayer
{
    public class Mer_BUS : Table_BUS<Mer, Mer_DAO>, IMer
    {
        public UsrAct_DAO UsrAct
        {
            get => throw new NotImplementedException();
            set => throw new NotImplementedException();
        }

        public void CreateActCode(Mer obj)
        {
            throw new NotImplementedException();
        }

        public ObjectResult<sp_Mer_Info_Result> Get_Mer_Info()
        {
            return _dao.Get_Mer_Info();
        }

        public UsrAct GetUsrAct(int usrId)
        {
            throw new NotImplementedException();
        }

        public Mer Login(string login, string pwd)
        {
            throw new NotImplementedException();
        }

        public void Register(Mer obj)
        {
            throw new NotImplementedException();
        }

        public List<Mer> Filter(Mer obj)
        {
            throw new NotImplementedException();
        }

        public Mer GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Mer obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Mer obj)
        {
            throw new NotImplementedException();
        }

        System.Data.Objects.ObjectResult<sp_Mer_Info_Result> IMer.Get_Mer_Info()
        {
            throw new NotImplementedException();
        }


        public DateTime GetSubEndDate(Mer mer)
        {
            List<Tuple<DateTime, DateTime>> BuyHistory = new List<Tuple<DateTime, DateTime>>();

            var merSubs = mer.RcptSub.Where(rcptSub => rcptSub.Status == true && rcptSub.RcptSubDet.Count!=0);
            foreach (var sub in merSubs)
            {
                DateTime startDate = sub.Rcpt.DateAdd;
                DateTime endDate = startDate.AddDays(sub.RcptSubDet.Sum(rcptSubDet => rcptSubDet.Sub.DurDay));
                Tuple<DateTime, DateTime> tup = new Tuple<DateTime, DateTime>(startDate, endDate);
                BuyHistory.Add(tup);
            }
            if (BuyHistory.Count != 0)
            {
                DateTime SubEndDate = BuyHistory[0].Item2;
                for (int i = 1; i < BuyHistory.Count; i++)
                {
                    DateTime rowBeforeEndDate = SubEndDate;
                    DateTime rowStartDate = BuyHistory[i].Item1;
                    DateTime rowEndDate = BuyHistory[i].Item2;

                    TimeSpan gap;
                    if (rowStartDate.CompareTo(rowBeforeEndDate) < 0)
                    {
                        gap = rowBeforeEndDate.Subtract(rowStartDate);
                        SubEndDate = rowEndDate.Add(gap);
                    }
                    else
                    {
                        SubEndDate = rowEndDate;
                    }
                }
                //.Sum(rcptSub => rcptSub.RcptSubDet.Sum(rcptSubDet => rcptSubDet.Sub.DurDay));
                return SubEndDate;
            }
            return DateTime.Now;
        }
    }
}