using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class Admin1 : Page
    {
        public void BindDataListview()
        {
            var rs1 = MyLibrary.RcptBuyDet_BUS.GetAll().Where(x => x.Cmt != null).ToList();
            if (rs1.Count() == 0)
            {
                lbEmpty2.Visible = true;
            }
            else
            {
                lvCmt.DataSource = rs1;
                lvCmt.DataBind();
            }
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
            else
            {
                lbEmpty.Visible = true;
            }
            lvNeedToActive.DataBind();
        }

        public void LoadTotalInfo()
        {
            lbTotalPrice.Text = MyLibrary.RcptSubDet_BUS.TotalPrice().ToFormatMoney();
            lbTotalRcpt.Text = MyLibrary.Rcpt_BUS.TotalRcpt().ToString();
            lbTotalPro.Text = MyLibrary.Pro_BUS.TotalPro().ToString();
            lbTotalMerCus.Text = MyLibrary.Usr_BUS.TotalMerCus().ToString();
        }

        protected void lvNeedToActive_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var ProId = int.Parse(e.CommandArgument.ToString());
            var ShpIdhdf = (HiddenField) e.Item.FindControl("hdfShpId");
            var ShpId = int.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                var updatePro = MyLibrary.Pro_BUS.GetAll().FirstOrDefault(x => x.ProId == ProId && x.ShpId == ShpId);
                updatePro.Active = true;
                MyLibrary.Pro_BUS.Update(updatePro);
                LoadLvNeedToActive();
            }
            else if (e.CommandName == "Sel")
            {
                Response.Redirect("/Admin/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId=" + ShpId);
            }
        }

        protected void lvNeedToActive_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvNeedToActive();
        }

        protected void lvNeedToActive_SelectedIndexChanged(object sender, EventArgs e)
        {
            MyLibrary.Show("Hello");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTotalInfo();
                LoadLvNeedToActive();
                BindDataListview();
            }
        }
    }
}