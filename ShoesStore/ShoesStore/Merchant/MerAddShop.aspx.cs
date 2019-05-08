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
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == usr1.UsrId).Select(x => x.ShpId).FirstOrDefault();

            //string proName = inputProName.Text;
            string desc = inputDesc.Text;
            string shpname = inputShpName.Text;

            //if (ShpId == 0)
            //{
            //    MyLibrary.Show("Chưa có thông tin cửa hàng");
            //    return;
            //}
            if (ShpId == usr1.UsrId)
            {
                MyLibrary.Show("Bạn đã có trang bán hàng rồi !");
                return;
            }
            if (ShpId == 0)
            {
                var shp = new Shp
                {
                    ShpName = shpname,
                    Desc = desc,
                };
                MyLibrary.Shp_Bus.Insert(shp);
            }
            //foreach (SizeColor item in sizeColors)
            //{
            //    ProDet proDet = new ProDet
            //    {
            //        ShpId = ShpId,
            //        ProId = MyLibrary.Pro_BUS.GetMaxId(),
            //        SizeId = item.Size.SizeId,
            //        ColorId = item.Color.ColorId,
            //        Qty = item.Qty
            //    };
            //    MyLibrary.ProDet_BUS.Insert(proDet);
            //}
            //MyLibrary.Show("Bài đăng của bạn sẽ được kiểm duyệt trong 24 giờ! :) ");
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
    }
}