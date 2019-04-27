using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using ShoesStore;

namespace ShoesStore.Merchant
{
    public partial class SubGet : System.Web.UI.Page
    {
        protected static Pro _proDetView;
        protected static Mer _merView;

        //Khai báo biến Sub

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridViewData();
            }

        }
        protected void txtQty_OnTextChanged(object sender, EventArgs e)
        {
            
            //string price = thisRptItem.FindControl("");
        }
        public void BindGridViewData()
        {
            gvSub.DataSource = MyLibrary.Sub_BUS.GetAll();
            gvSub.DataBind();
        }

        /*
        //protected void Choose(object sender, EventArgs e)
        //{
        //    Hdnfld.Visible = true;
        //}
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


        int subId = 0;
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvSub_SelectedIndexChanged(object sender, EventArgs e)
        {
            var rcptBuyId = int.Parse((gvSub.SelectedRow.FindControl("lbSubId") as Label).Text);
            subId = rcptBuyId;
            LoadTableSubSelected(subId);
        }

        public void LoadTableSubSelected(int SubId)
        {
            TableRow row = new TableRow();
            var rs = MyLibrary.Sub_BUS.GetAll().Where(x => x.SubId == subId).Select(x => x.SubContent).FirstOrDefault();
            var slNgay = MyLibrary.Sub_BUS.GetAll().Where(x => x.SubId == subId).Select(x => x.DurDay).FirstOrDefault();
            var price = MyLibrary.Sub_BUS.GetAll().Where(x => x.SubId == subId).Select(x => x.Price).FirstOrDefault();
            lblSubContent.Text = rs;
            
            lbTongNgayCon.Text = (Int32.Parse(txtQty.Text) * slNgay).ToString();
            lbTongTienCon.Text = (Int32.Parse(txtQty.Text) * Int32.Parse(price)).ToString();
            
        }
       
    }
}