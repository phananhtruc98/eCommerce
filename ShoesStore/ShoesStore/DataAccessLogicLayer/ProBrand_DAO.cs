﻿using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class ProBrand_DAO : Table_DAO<ProBrand>, IProBrand
    {
        public ProBrand GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }

        public int GetLastestId()
        {
            throw new NotImplementedException();
        }

        public override void SetActive(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(ProBrand obj)
        {
            throw new NotImplementedException();
        }
    }
}