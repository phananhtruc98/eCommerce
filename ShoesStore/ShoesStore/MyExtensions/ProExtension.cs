using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Ajax.Utilities;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.MyExtensions
{
    public static class ProExtension
    {
        public static List<Pro> FilterByName(this List<Pro> listPro, string name)
        {
            return listPro.Where(m => m.ProName == name).ToList();
        }
    }
}