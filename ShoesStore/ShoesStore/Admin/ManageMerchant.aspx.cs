using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using Utilities;

namespace ShoesStore.Admin
{
    public partial class Manage_User : Page
    {
        private readonly Mer_BUS mer_BUS = new Mer_BUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGridViewData();
        }

        // Load bảng mer
        private void BindGridViewData()
        {
            lvMer.DataSource = mer_BUS.GetAll();
            lvMer.DataBind();
        }

        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvMerchant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        // Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in MyLibrary.Mer_BUS.GetAll().ToList()
                      where a.MerId.ToString().ContainsEx(search_key)
                            || a.Usr.UsrName.ContainsEx(search_key)
                            || a.Usr.DateAdd != null && a.Usr.DateAdd.ToString().ContainsEx(search_key)
                      select a).ToList();
            lvMer.DataSource = rs;
            lvMer.DataBind();
        }

        //Phân trang
        protected void gvMerchant_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMerchant.PageIndex = e.NewPageIndex;
            BindGridViewData();
        }

        protected void lvMer_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "sel")
            {
                int merId = Int32.Parse(e.CommandArgument.ToString());

                Mer mer = MyLibrary.Mer_BUS.GetAll().FirstOrDefault(m => m.MerId == merId);
                string content = mer.GetSubEndDate().CompareTo(DateTime.Now.AddMinutes(1)) < 0 ? "Hết hạn" : mer.GetSubEndDate().ToString();
                Email.SendGmail(mer.Usr.Email, "Nhắc nhỡ thời hạn đăng ký sub",
                   $"Thời hạn đăng ký của bạn {content}. Mời bạn gia hạn thêm sub");
                MyLibrary.Show("Đã gởi mail !");

            }
            else if (e.CommandName == "Detail")
            {
                int UsrId = Int32.Parse(e.CommandArgument.ToString());
                Server.Transfer("/Admin/Usr_Det.aspx?UsrId=" + UsrId);
            }
        }

        protected void lvMer_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindGridViewData();
        }
    }
}