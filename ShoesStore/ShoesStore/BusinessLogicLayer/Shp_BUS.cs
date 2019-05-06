using System;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;
using System.Linq;
namespace ShoesStore.BusinessLogicLayer
{
    public class Shp_BUS : Table_BUS<Shp, Shp_DAO>
    {
        public override bool IsExist(Shp obj)
        {
            throw new NotImplementedException();
           
        }

        public override void SetActive(Shp obj)
        {
            throw new NotImplementedException();
        }

        public  string ShpUrl(Shp obj)
        {
            return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + $"/{TextHelper.UrlFriendly(obj.ShpName)}";
        }
        public  Shp GetShp(string shpNameUrlCode)
        {
            
            return GetAll().FirstOrDefault(m => m.ShpName == shpNameUrlCode);
        }
    }
}