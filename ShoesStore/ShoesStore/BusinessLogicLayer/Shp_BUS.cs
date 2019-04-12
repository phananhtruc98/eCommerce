using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class Shp_BUS : Table_BUS<Shp, Shp_DAO>, IShp
    {
    }
}