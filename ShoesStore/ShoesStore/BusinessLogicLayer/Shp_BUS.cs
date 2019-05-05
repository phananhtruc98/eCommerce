using System;
using System.Web;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using Utilities;

namespace ShoesStore.BusinessLogicLayer
{
    public class Shp_BUS : Table_BUS<Shp, Shp_DAO>, IShp
    {
        public override bool IsExist(Shp obj)
        {
            throw new NotImplementedException();
        }

        public override void SetActive(Shp obj)
        {
            throw new NotImplementedException();
        }

        public static string ShpUrl(Shp obj)
        {
            return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + $"/{TextHelper.UrlFriendly(obj.ShpName)}";
        }
    }
}