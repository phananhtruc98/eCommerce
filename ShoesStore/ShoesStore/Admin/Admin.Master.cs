using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Admin : MasterPage
    {
        private readonly Mstr_BUS mstr_BUS = new Mstr_BUS(); 
        private readonly MstrDet_BUS mstrDet_BUS = new MstrDet_BUS(); 
        private readonly MstrRole_BUS mstrRole_BUS = new MstrRole_BUS(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Page_Init(object sender, EventArgs e)
        {
            if (AdminSession.LoginAdmin != null)
            {
                int UsrId = (AdminSession.LoginAdmin as Usr).UsrId;
                string avaImg = (AdminSession.LoginAdmin as Usr)?.Avatar;
                lbAccount.Text = $"Chào {(AdminSession.LoginAdmin as Usr)?.UsrName}";
                lbAccount2.Text = $"Chào {(AdminSession.LoginAdmin as Usr)?.UsrName}";
                avaImg1.Attributes["src"] = "/Admin/images/avatar/" + avaImg + ".jpg";
                avaImg2.Attributes["src"] = "/Admin/images/avatar/" + avaImg + ".jpg";
                var rs = (from m in mstr_BUS.GetAll()
                          join d in mstrDet_BUS.GetAll() on m.MstrId equals d.MstrId
                          join r in mstrRole_BUS.GetAll() on d.RoleId equals r.RoleId
                          where m.MstrId == UsrId
                          select new
                          {
                              RoleName = r.RoleName
                          }).FirstOrDefault();
                lbrolename.Text = rs.RoleName;
            }
            else
            {
                Response.Redirect("~/quan-tri/dang-nhap");
            }
        }
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            AdminSession.LoginAdmin = null;
            Response.Redirect("~/quan-tri/dang-nhap");
        }

        

    }
}