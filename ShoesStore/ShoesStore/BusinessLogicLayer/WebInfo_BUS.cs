using System;
using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.BusinessLogicLayer
{
    public class WebInfo_BUS : Table_BUS<WebInfo, WebInfo_DAO>
    {
        public List<WebSlide> GetSlides()
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(WebInfo obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(WebInfo obj)
        {
            throw new NotImplementedException();
        }
    }
}