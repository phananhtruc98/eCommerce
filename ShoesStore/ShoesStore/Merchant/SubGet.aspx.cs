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
            Bind_lvSubSelected(subId);
        }

        public void Bind_lvSubSelected(int SubId)
        {
            var rs = from s in MyLibrary.Sub_BUS.GetAll()
                     where s.SubId == SubId
                     select s;
            lvSubSelected.DataSource = rs.ToList();
            lvSubSelected.DataBind();
        }

        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                TextBox txtSoLuong = (TextBox)e.Item.FindControl("txtSoLuong");
                txtSoLuong.TextChanged += TxtSoLuong_TextChanged;
                string txtSl = txtSoLuong.Text;
                Label lbTongNgayCon = (Label)e.Item.FindControl("lbTongNgayCon");
                lbTongNgayCon.Text = txtSl;
            }
        }

        private void TxtSoLuong_TextChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}