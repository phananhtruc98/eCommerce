﻿using System;
using ShoesStore.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Cart_DAO : Table_DAO<Cart>, ICart
    {
        public override bool IsExist(Cart obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Cart obj)
        {
            throw new NotImplementedException();
        }
    }
}