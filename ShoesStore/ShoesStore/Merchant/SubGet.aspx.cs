using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class SubGet : System.Web.UI.Page
    {
        protected static Pro _proDetView;
        private CartDet _cartDetView;

        //Khai báo biến Sub
        protected static Sub _subView;
        protected static RcptSub _rcptsubView;
        private RcptSubDet _rcptsubDetView;


        readonly Sub_BUS sub_BUS = new Sub_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridViewData();
            }
        }

        private void BindGridViewData()
        {
            gvSub.DataSource = sub_BUS.GetAll();
            gvSub.DataBind();
        }
        protected void btnAddCart_OnClick(object sender, EventArgs e)
        {

            //Nếu Chưa đăng nhập thì bắt đăng nhập
            if (MerchantSession.LoginMer == null)
            {
                MyLibrary.Show("Bạn chưa đăng nhập");
                return;
            }


            int colorId = 0;
            int sizeId = 0;
            /*
            // Nếu có màu , nếu checked màu thì bỏ colorid vào
            foreach (RepeaterItem item in rptProColor.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rdbColor = (RadioButton)item.FindControl("rdbColor");
                    if (rdbColor.Checked)
                    {
                        colorId = System.Convert.ToInt32(((HiddenField)item.FindControl("hdfColorId")).Value);
                    }

                }
            }
            //Nếu có size, nếu checked sized thì bỏ sizeid vào
            foreach (RepeaterItem item in rptProSize.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    var rdbSize = (RadioButton)item.FindControl("rdbSize");
                    if (rdbSize.Checked)
                    {
                        sizeId = System.Convert.ToInt32(((HiddenField)item.FindControl("hdfSizeId")).Value);
                    }

                }
            }
            */
           
            //Gọi CartDet() lấy các thuộc tính trong dtb, gán những cái thuộc tính đó , cho những cái đã bắt từ link ở trên sau khi bấm nút, Qty là số lượng
            // Nếu đã tồn tại cái giỏ hàng đó thì đẩy qua else, còn không thì Load vào trong CartDet
            _cartDetView = new CartDet()
            {
                CartId = MyLibrary.Cart_BUS.GetMyCart().CartId,
                ShpId = _proDetView.ShpId,
                ProId = _proDetView.ProId,
                ColorId = colorId,
                SizeId = sizeId,
                Qty = System.Convert.ToInt32(product_quantity.Value)

            };
            if (!MyLibrary.CartDet_BUS.IsExist(_cartDetView))
            {
                MyLibrary.CartDet_BUS.Insert(_cartDetView);
                Master.LoadCartPreview();

            }
            else
            {

            }

        }


    }
        
        


    }
}