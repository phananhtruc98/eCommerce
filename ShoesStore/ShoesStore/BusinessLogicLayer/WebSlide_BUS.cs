using System;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.BusinessLogicLayer
{
    public class WebSlide_BUS:Table_BUS<WebSlide,WebSlide_DAO>
    {
        public override bool IsExist(WebSlide obj)
        {
            throw new NotImplementedException();
        }
        public override void SetActive(WebSlide obj)
        {
            throw new NotImplementedException();
        }
    }
}