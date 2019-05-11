using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web;
using ShoesStore.MyExtensions;
namespace ShoesStore.Merchant
{
    public partial class MerAddShop : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                phdPage.MerExpired();
            }
        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            string desc = inputDesc.Text;
            string shpname = inputShpName.Text;
            string address = inputAddr.Text;
            string phone = inputNum.Text;


            var shp1 = new Shp
            {
                ShpId = mer.MerId,
                MerId = mer.MerId,
                ShpName = shpname,
                DateStart =  DateTime.Now,
                Active = true,
                Desc = desc,
                Address = address,
                Phone = phone
            };
            MyLibrary.Shp_Bus.Insert(shp1);
        }
    }
}