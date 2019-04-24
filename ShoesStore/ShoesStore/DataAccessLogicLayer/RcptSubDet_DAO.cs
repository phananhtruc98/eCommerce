using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
namespace ShoesStore.DataAccessLogicLayer
{
    public class RcptSubDet_DAO : Table_DAO<RcptSubDet>, IRcptSubDet
    {
        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            var result = (from r in GetAll()
                         where r.RcptSubId == RcptSubId
                         select r).ToList();
            return result;
        }
        public override bool IsExist(RcptSubDet obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(RcptSubDet obj)
        {
            throw new NotImplementedException();
        }
    }
}