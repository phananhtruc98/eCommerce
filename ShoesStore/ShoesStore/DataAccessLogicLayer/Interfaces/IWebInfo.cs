using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.DataAccessLogicLayer
{
    public interface IWebInfo : IDataAccess<WebInfo>
    {
        List<WebSlide> GetSlides();
    }
}
