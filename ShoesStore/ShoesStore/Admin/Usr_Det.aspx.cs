using ShoesStore.DataAccessLogicLayer;
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
                LoadInfo(UsrId);
            }
        }
        public void LoadInfo(int UsrId)
        {
            var rs = MyLibrary.Usr_BUS.GetAll().Where(x=>x.UsrId==UsrId).FirstOrDefault();
            lbUsrId.Text = rs.UsrId.ToString();
            lbUsrName.Text = rs.UsrName;
            lbPhone.Text = rs.Phone;
            lbEmail.Text = rs.Email;
            lbDateAdd.Text = rs.DateAdd.ToShortDateString();
            lbDateEdit.Text = rs.DateEdit == null ? "" : rs.DateEdit.ToString();

            if (MyLibrary.Cus_BUS.GetAll().Select(x => x.CusId).Contains(rs.UsrId))
            {
                Cus cus = MyLibrary.Cus_BUS.GetAll().Where(x => x.CusId == UsrId).FirstOrDefault();
                lbUsrType.Text = "Người mua";
                avatar.Attributes["src"] = MyLibrary.CusImgPath(cus);
            }
            else if (MyLibrary.Mer_BUS.GetAll().Select(x => x.MerId).Contains(rs.UsrId))
            {
                Mer mer = MyLibrary.Mer_BUS.GetAll().Where(x => x.MerId == UsrId).FirstOrDefault();
                lbUsrType.Text = "Người bán";
                avatar.Attributes["src"] = MyLibrary.MerImgPath(mer);
            }
            else
            {
                Mstr mstr = MyLibrary.Mstr_BUS.GetAll().Where(x => x.MstrId == UsrId).FirstOrDefault();
                lbUsrType.Text = "Quản trị viên";
                avatar.Attributes["src"] = MyLibrary.AdminImgPath(mstr);
            }
        }
    }
}