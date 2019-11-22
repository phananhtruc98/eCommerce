using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ShoesStore.Merchant;

namespace ShoesStore.MyExtensions
{
    public static partial class MyExtensions
    {
        public static void ClearTextBoxes(this Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                switch (ctrl)
                {
                    case TextBox txtBox:
                    {
                        if (txtBox != null) txtBox.Text = string.Empty;
                        break;
                    }
                    case HtmlInputText htmlInputText:
                    {
                        if (htmlInputText != null) htmlInputText.Value = string.Empty;
                        break;
                    }
                    case CheckBox chk:
                    {
                        if (chk != null) chk.Checked = false;
                        break;
                    }
                    default:
                    {
                        if (ctrl.Controls.Count > 0) ClearTextBoxes(ctrl);
                        break;
                    }
                }

                ;
            }
        }

        public static void MerExpired(this PlaceHolder phd)
        {
            if (MerchantSession.LoginMer.GetSubEndDate().CompareTo(DateTime.Now.AddMinutes(1)) < 0)
            {
                var lb = new Label
                {
                    Text = "Bạn đã hết hạn, xin mời gia hạn thêm sub "
                };

                phd.Controls.Clear();
                phd.Controls.Add(lb);
            }
        }
    }
}