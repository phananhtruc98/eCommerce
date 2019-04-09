using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class WebInfo_BUS : Table_BUS<WebInfo, WebInfo_DAO>
    {
        private readonly WebInfo_DAO _dao = new WebInfo_DAO();


        public List<WebSlide> GetSlides()
        {
            throw new NotImplementedException();
        }
    }
}