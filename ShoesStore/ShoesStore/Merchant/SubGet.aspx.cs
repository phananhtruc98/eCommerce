using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class SubGet : Page
    {
        protected static Pro _proDetView;
        protected static Mer _merView;

        //Khai báo biến Sub
        protected static Sub _subView;
        protected static RcptSub _rcptsubView;
        private readonly Sub_BUS sub_BUS = new Sub_BUS();
        private CartDet _cartDetView;
        private RcptSubDet _rcptsubDetView;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGridViewData();
        }

        private void BindGridViewData()
        {
            gvSub.DataSource = sub_BUS.GetAll();
            gvSub.DataBind();
        }
        /*
        protected void Choose(object sender, EventArgs e)
        {
            Hdnfld.Visible = true;
        }
        */
        protected void rptSubDet_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                //ltrSumPerShp.Text=rptCartDetCart.Items.
            }
        }

        /*
        protected void btnAddCart_OnClick(object sender, EventArgs e)
        {
            //Gọi CartDet() lấy các thuộc tính trong dtb, gán những cái thuộc tính đó , cho những cái đã bắt từ link ở trên sau khi bấm nút, Qty là số lượng
            // Nếu đã tồn tại cái giỏ hàng đó thì đẩy qua else, còn không thì Load vào trong CartDet
            _rcptsubDetView = new RcptSubDet
            {
                RcptSubId = ShoesStore.MyLibrary.RcptSubDet_BUS.GetMyRcptSubDet().RcptSubId,
                SubId = _subView.SubId,
                MerId = _merView.MerId,
                //Quantity = System.Convert.ToInt32(product_quantity.Value)
            };
            if (!MyLibrary.RcptSubDet_BUS.IsExist(_rcptsubDetView)) MyLibrary.RcptSubDet_BUS.Insert(_rcptsubDetView);
        }
        */


    }
}