using System;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Merchant
{
    public partial class MerAddShop : Page
    {
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var mer = (Mer) MerchantSession.LoginMerchant;
            var desc = inputDesc.Text;
            var shpname = inputShpName.Text;
            var address = inputAddr.Text;
            var phone = inputNum.Text;


            var shp1 = new Shp
            {
                ShpId = mer.MerId,
                MerId = mer.MerId,
                ShpName = shpname,
                DateStart = DateTime.Now,
                Active = true,
                Desc = desc,
                Address = address,
                Phone = phone
            };
            MyLibrary.Shp_Bus.Insert(shp1);
            Response.Redirect("MerHome.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
    }
}