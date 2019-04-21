﻿using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;

namespace ShoesStore.BusinessLogicLayer
{
    public class RcptSubDet_BUS: Table_BUS<RcptSubDet, RcptSubDet_DAO>, IRcptSubDet
    {
        
        public List<RcptSubDet> SelectedRowById(int RcptSubId)
        {
            return _dao.SelectedRowById(RcptSubId);

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