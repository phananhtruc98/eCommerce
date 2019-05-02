using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Merchant
{
    public partial class MerPromotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadLvPro();
            }

        }

        public void LoadLvPro()
        {
            var rs = (from p in MyLibrary.Pro_BUS.GetAll()
                      where p.Active == false
                      select p).ToList();
            if (rs.Count != 0)
            {
                lvPro.DataSource = rs;
                lvPro.DataBind();
            }
            else lbEmpty.Visible = true;
        }

        protected void lvPro_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int ProId = Int32.Parse(e.CommandArgument.ToString());
            HiddenField ShpIdhdf = (HiddenField)e.Item.FindControl("hdfShpId");
            int ShpId = Int32.Parse(ShpIdhdf.Value);
            if (e.CommandName == "Submit")
            {
                //Pro updatePro = MyLibrary.Pro_BUS.GetAll().FirstOrDefault(x => x.ProId == ProId && x.ShpId == ShpId);
                //updatePro.Active = true;
                //MyLibrary.Pro_BUS.Update(updatePro);
                //LoadLvPro();
            }
            else if (e.CommandName == "Sel")
            {
                Server.Transfer("/Merchant/ReviewProductDetail.aspx?ProId=" + ProId + "&ShpId=" + ShpId);
            }
        }

        protected void lvPro_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadLvPro();
        }
    }
}