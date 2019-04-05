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

      


    }
}