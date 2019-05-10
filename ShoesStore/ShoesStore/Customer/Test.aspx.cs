using System;
using System.Web.UI;

namespace ShoesStore.Customer
{
    public partial class Test : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt1.Attributes.Add("onfocus", $"HookUpControl(this,'{CustomValidator1.ClientID}')");
            txt2.Attributes.Add("onfocus", $"HookUpControl(this,'{CustomValidator1.ClientID}')");
            txt3.Attributes.Add("onfocus", $"HookUpControl(this,'{CustomValidator1.ClientID}')");
            txt4.Attributes.Add("onfocus", $"HookUpControl(this,'{CustomValidator1.ClientID}')");
        }
    }
}