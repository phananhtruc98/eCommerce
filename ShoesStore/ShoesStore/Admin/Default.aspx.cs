using System;
using System.Web.UI;
using System.Linq;
using ShoesStore.DataAccessLogicLayer;
using System.Web.UI.WebControls;
using ShoesStore;
using ShoesStore.MyExtensions;
namespace ShoesStore.Admin
{
    public partial class Admin1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTotalInfo();
                LoadLvNeedToActive();
            }

        }
        public void LoadTotalInfo()
        {
            lbTotalPrice.Text = MyLibrary.RcptSubDet_BUS.TotalPrice().ToFormatMoney();
            lbTotalRcpt.Text = MyLibrary.Rcpt_BUS.TotalRcpt().ToString();
            lbTotalPro.Text = MyLibrary.Pro_BUS.TotalPro().ToString();
            lbTotalMerCus.Text = MyLibrary.Usr_BUS.TotalMerCus().ToString();
        }

        public void LoadLvNeedToActive()
        {
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.Active == false
                      select p).ToList();
            if (rs.Count != 0)
            {
                lvNeedToActive.DataSource = rs;
                lvNeedToActive.DataBind();
            }
            else lbEmpty.Visible = true;
        }

        protected void lvNeedToActive_PagePropertiesChanging(object sender, System.Web.UI.WebControls.PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvNeedToActive();
        }

        protected void lvNeedToActive_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int ProId = Int32.Parse(e.CommandArgument.ToString());
            HiddenField ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            int ShpId = Int32.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                Pro updatePro = MyLibrary.Pro_BUS.GetAll().FirstOrDefault(x => x.ProId == ProId && x.ShpId == ShpId);
                updatePro.Active = true;
                MyLibrary.Pro_BUS.Update(updatePro);
                LoadLvNeedToActive();
            }
            else if (e.CommandName == "Sel")
            {
                Server.Transfer("/Admin/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId="+ ShpId);
            }
        }

        protected void lvNeedToActive_SelectedIndexChanged(object sender, EventArgs e)
        {
            MyLibrary.Show("Hello");
        }


    }
}