using System.Collections.Generic;

namespace ShoesStore.DataAccessLogicLayer
{
    public interface IWebInfo : IDataAccess<WebInfo>
    {
        List<WebSlide> GetSlides();
    }
}