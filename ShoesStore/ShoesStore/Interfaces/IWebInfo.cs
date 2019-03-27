using System.Collections.Generic;
using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IWebInfo : ITable<WebInfo>
    {
        List<WebSlide> GetSlides();
    }
}