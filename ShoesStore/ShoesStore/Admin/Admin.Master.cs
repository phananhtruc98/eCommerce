using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Web.UI;
using System.Linq;

namespace ShoesStore.Admin
{
    public partial class Admin : MasterPage
    {
        private readonly Mstr_BUS mstr_BUS = new Mstr_BUS();
        public Usr_BUS usr_BUS = new Usr_BUS();
        private readonly MstrDet_BUS mstrDet_BUS = new MstrDet_BUS(); 
        private readonly MstrRole_BUS mstrRole_BUS = new MstrRole_BUS(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        int UsrId = 0;
        string UsrName = "";
        string Address = "";
        string Avatar = "";
        string Email = "";
        string Phone = "";
        string login = "";
        string password = "";

        public int UsrId1 { get => UsrId; set => UsrId = value; }
        public string UsrName1 { get => UsrName; set => UsrName = value; }
        public string Address1 { get => Address; set => Address = value; }
        public string Avatar1 { get => Avatar; set => Avatar = value; }
        public string Email1 { get => Email; set => Email = value; }
        public string Phone1 { get => Phone; set => Phone = value; }
        public string Login { get => login; set => login = value; }
        public string Password { get => password; set => password = value; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (AdminSession.LoginAdmin != null)
            {
                Mstr mstr = (Mstr)AdminSession.LoginAdmin;
                Usr mstrUsr = usr_BUS.GetAll().FirstOrDefault(m => m.UsrId == mstr.MstrId);
                UsrId = mstrUsr.UsrId;
                 UsrName = mstrUsr.UsrName;
                 Address = mstrUsr.Address;
                 Avatar = mstrUsr.Avatar;
                 Email = mstrUsr.Email;
                 Phone = mstrUsr.Phone;
                 login = mstrUsr.Login;
                 password = mstrUsr.Password;
                string avaImg = Avatar;
                lbAccount.Text = $"Chào "+UsrName;
                lbAccount2.Text = $"Chào " + UsrName;
                avaImg1.Attributes["src"] = "/Admin/images/avatar/" + avaImg;
                avaImg2.Attributes["src"] = "/Admin/images/avatar/" + avaImg;
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

        protected void lbtnAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/quan-tri/thong-tin-ca-nhan");
        }
    }
}