using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Admin
{
    public partial class Admin : MasterPage
    {
        private readonly Mstr_BUS mstr_BUS = new Mstr_BUS();
        private readonly MstrDet_BUS mstrDet_BUS = new MstrDet_BUS();
        private readonly MstrRole_BUS mstrRole_BUS = new MstrRole_BUS();
        public Usr_BUS usr_BUS = new Usr_BUS();
        public int UsrId1 { get; set; }
        public string UsrName1 { get; set; } = "";
        public string Address1 { get; set; } = "";
        public string Avatar1 { get; set; } = "";
        public string Email1 { get; set; } = "";
        public string Phone1 { get; set; } = "";
        public string Login { get; set; } = "";
        public string Password { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (AdminSession.LoginAdmin != null)
            {
                var mstr = (Mstr) AdminSession.LoginAdmin;
                var mstrUsr = usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
                UsrId1 = mstrUsr.UsrId;
                UsrName1 = mstrUsr.UsrName;
                Address1 = mstrUsr.Address;
                Avatar1 = mstrUsr.Avatar;
                Email1 = mstrUsr.Email;
                Phone1 = mstrUsr.Phone;
                Login = mstrUsr.Login;
                Password = mstrUsr.Password;
                var avaImg = Avatar1;
                lbAccount.Text = "Chào " + UsrName1;
                lbAccount2.Text = "Chào " + UsrName1;
                avaImg1.Attributes["src"] = "/Admin/images/avatar/" + avaImg;
                avaImg2.Attributes["src"] = "/Admin/images/avatar/" + avaImg;
                var rs = (from m in mstr_BUS.GetAll()
                    join d in mstrDet_BUS.GetAll() on m.MstrId equals d.MstrId
                    join r in mstrRole_BUS.GetAll() on d.RoleId equals r.RoleId
                    where m.MstrId == UsrId1
                    select new
                    {
                        r.RoleName
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

        protected void lbtnAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/quan-tri/thong-tin-ca-nhan");
        }
    }
}