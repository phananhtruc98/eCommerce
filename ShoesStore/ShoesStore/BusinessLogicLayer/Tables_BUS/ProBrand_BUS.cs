﻿using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.DataAccessLogicLayer.Tables_DAO;

namespace ShoesStore.BusinessLogicLayer.Tables_BUS
{
    public class ProBrand_BUS : IProBrand
    {
        private readonly IProBrand proBrand = new ProBrand_DAO();

        public void Delete(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public List<ProBrand> GetAll()
        {
            return proBrand.GetAll();
        }

        public void Insert(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public void Update(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public void SetActive()
        {
            throw new NotImplementedException();
        }

        public List<ProBrand> Filter(ProBrand obj)
        {
            throw new NotImplementedException();
        }

        public ProBrand GetById(int id)
        {
            throw new NotImplementedException();
        }

        public ProBrand GetByPrimaryKeys(int id)
        {
            throw new NotImplementedException();
        }
    }
}