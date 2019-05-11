using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Usr_Det : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int UsrId = int.Parse(Request.QueryString["UsrId"]);
            if (!IsPostBack)
            {
                LoadInfo();
            }
        }
        public void LoadInfo()
        {
            var rs = MyLibrary.Usr_BUS.GetAll().FirstOrDefault();
            lbUsrId.Text = rs.UsrId.ToString();
            lbUsrName.Text = rs.UsrName;
            lbPhone.Text = rs.Phone;
            lbEmail.Text = rs.Email;
            lbDateAdd.Text = rs.DateAdd.ToShortDateString();
            lbDateEdit.Text = rs.DateEdit == null ? "" : rs.DateEdit.ToString();

            if (MyLibrary.Cus_BUS.GetAll().Select(x => x.CusId).Contains(rs.UsrId))
            {
                lbUsrType.Text = "Người mua";
                avatar.Attributes["src"] = MyLibrary.CusImgPath(rs);
            }
            else if (MyLibrary.Mer_BUS.GetAll().Select(x => x.MerId).Contains(rs.UsrId))
            {
                lbUsrType.Text = "Người bán";
                avatar.Attributes["src"] = MyLibrary.MerImgPath(rs);
            }
            else
            {
                lbUsrType.Text = "Quản trị viên";
                avatar.Attributes["src"] = MyLibrary.AdminImgPath(rs);
            }
        }
    }
}