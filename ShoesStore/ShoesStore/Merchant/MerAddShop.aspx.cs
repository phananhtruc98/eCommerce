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
        public class SizeColor
        {
            public ProSize Size { get; set; }
            public ProColor Color { get; set; }
            public int Qty { get; set; }
        }

        public static List<SizeColor> sizeColors = new List<SizeColor>();
        List<ProSize> lstProSize = new List<ProSize>();
        List<ProColor> lstProColor = new List<ProColor>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sizeColors.Clear();
                phdPage.MerExpired();
                
                
            }
        }

        

        

        
        
        protected void lvColoSize_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Sel")
            {
                Label txtKl = (Label)e.Item.FindControl("lblKl");
                TextBox txtSl = (TextBox)e.Item.FindControl("txtQty");
                Label txtCl = (Label)e.Item.FindControl("lbColorName");
                Label txtSz = (Label)e.Item.FindControl("lbSizeName");
                txtKl.Text = txtCl.Text + "(" + txtSl.Text + ")";

                var rs = (from sc in sizeColors
                          where sc.Size.SizeName == txtSz.Text && sc.Color.ColorName == txtCl.Text
                          select sc).FirstOrDefault();
                rs.Qty = Int32.Parse(txtSl.Text);
            }
            else if (e.CommandName == "Del")
            {
                sizeColors.RemoveAt(Int32.Parse(e.CommandArgument.ToString()));
                
            }
        }
        

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            var mer = (Mer)MerchantSession.LoginMerchant;
            var usr1 = MyLibrary.Usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mer.MerId);
            int ShpId = MyLibrary.Shp_Bus.GetAll().Where(x => x.MerId == usr1.UsrId).Select(x => x.ShpId).FirstOrDefault();
            
            string proName = inputProName.Text;
            string desc = editor1.Text;
            
            
            string Img = "";
            
            if (ShpId == 0)
            {
                MyLibrary.Show("Chưa có thông tin cửa hàng");
                return;
            }
            var pro1 = new Pro
            {
                ShpId = ShpId,
                
                ProName = proName,
                Desc = desc,
                
               
                DateAdd = DateTime.Now,
                DateEdit = null,
                IsOutOfStock = true,
                Active = false,
                PriceAfter = null,
                Img = Img
            };
            MyLibrary.Pro_BUS.Insert(pro1);

            foreach (SizeColor item in sizeColors)
            {
                ProDet proDet = new ProDet
                {
                    ShpId = ShpId,
                    ProId = MyLibrary.Pro_BUS.GetMaxId(),
                    SizeId = item.Size.SizeId,
                    ColorId = item.Color.ColorId,
                    Qty = item.Qty
                };
                MyLibrary.ProDet_BUS.Insert(proDet);
            }
            
            MyLibrary.Show("Bài đăng của bạn sẽ được kiểm duyệt trong 24 giờ! :) ");
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
    }
}