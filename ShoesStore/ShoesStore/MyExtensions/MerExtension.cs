using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static DateTime GetSubEndDate(this Mer mer)
        {
            return MyLibrary.Mer_BUS.GetSubEndDate(mer);
        }
    }
}