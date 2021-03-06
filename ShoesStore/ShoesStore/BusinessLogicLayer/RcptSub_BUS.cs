﻿using System;
using System.Collections.Generic;
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

        public List<RcptSub> ListRcptSubPreview_Rcpt(int MerId)
        {
            var RcptId = MyLibrary.RcptSubDet_BUS.ListRcptBuyDet_SubContent().Select(m => m.RcptSubId).OrderBy(x => x)
                .Distinct().ToArray();
            var tmp = MyLibrary.RcptSub_BUS.GetAll().Where(m => RcptId.Contains(m.RcptSubId) && m.MerId.Equals(MerId))
                .OrderByDescending(x => x.Rcpt.DateAdd).ToList();
            return tmp;
        }

        public double SumAll()
        {
            return GetAll().Sum(m => m.RcptSubDet.Sum(n => double.Parse(n.Sub.Price)));
        }

        public string SumDayRcptSub(Rcpt Rcpt, int MerId)
        {
            double Ngay = 0;
            var rcptSub = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.RcptSubId == Rcpt.RcptId && x.MerId == MerId)
                .FirstOrDefault();
            var rcptSubDetLst = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == rcptSub.RcptSubId).ToList();
            foreach (var item in rcptSubDetLst)
            {
                var tongNgay = double.Parse(item.Quantity.ToString()) * double.Parse(item.Sub.DurDay.ToString());
                Ngay = Ngay + tongNgay;
            }

            return Ngay.ToString();
        }

        public string SumPriceRcptSub(Rcpt Rcpt, int MerId)
        {
            double Tien = 0;
            var rcptSub = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.RcptSubId == Rcpt.RcptId && x.MerId == MerId)
                .FirstOrDefault();
            var rcptSubDetLst = MyLibrary.RcptSubDet_BUS.GetAll().Where(x => x.RcptSubId == rcptSub.RcptSubId).ToList();
            foreach (var item in rcptSubDetLst)
            {
                var tongTien = double.Parse(item.Quantity.ToString()) * double.Parse(item.Sub.Price);
                Tien = Tien + tongTien;
            }

            return Tien.ToString();
        }
    }
}