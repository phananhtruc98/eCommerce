using System.Collections.Generic;
using ShoesStore.DataAccessLogicLayer.Interfaces;

namespace ShoesStore.DataAccessLogicLayer
{
    public interface IWebInfo : ITable<WebInfo>
    {
        List<WebSlide> GetSlides();
    }
}