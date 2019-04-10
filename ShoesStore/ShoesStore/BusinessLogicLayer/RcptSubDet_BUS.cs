using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSubDet_BUS: Table_BUS<RcptSubDet, RcptSubDet_DAO>, IRcptSubDet
    {
        private readonly RcptSubDet_DAO _dao = new RcptSubDet_DAO();
        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            return _dao.SelectedRowById(RcptSubId);

        }


    }
}