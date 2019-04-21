﻿using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static Control FindControlInHeader(this Repeater repeater, string controlName)
        {
            return repeater.Controls[0].Controls[0].FindControl(controlName);
        }

        public static Control FindControlInFooter(this Repeater repeater, string controlName)
        {
            return repeater.Controls[repeater.Controls.Count - 1].Controls[0].FindControl(controlName);
        }
    }
}