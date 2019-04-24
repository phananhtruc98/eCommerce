using System;
using System.Collections.Generic;
using System.Linq;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptSubDet_DAO : Table_DAO<RcptSubDet>, IRcptSubDet
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
            var result = (from r in GetAll()
                where r.RcptSubId == RcptSubId
                select r).ToList();
            return result;
        }
    }
}