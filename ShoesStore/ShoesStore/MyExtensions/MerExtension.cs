using System;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static DateTime GetSubEndDate(this Mer mer)
        {
            return MyLibrary.Mer_BUS.GetSubEndDate(mer);
        }

        public static int GetSubExistDate(this Mer mer)
        {
            return MyLibrary.Mer_BUS.GetSubExistDate(mer);
        }
    }
}