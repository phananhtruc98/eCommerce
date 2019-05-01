using System;
using System.Data;
using System.Linq;
using System.Linq.Dynamic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class ManageRcpt : System.Web.UI.Page
    {
        private readonly Pro_BUS pro = new Pro_BUS();
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        private readonly Mer_BUS mer = new Mer_BUS();
        private readonly RcptBuyStaDet_BUS rcptbuystadet = new RcptBuyStaDet_BUS();
        private readonly RcptBuyStaStep_BUS rcptbuystastep = new RcptBuyStaStep_BUS();
        private readonly RcptSub_BUS rcptsub = new RcptSub_BUS();
        private readonly RcptSubDet_BUS rcptsubdet = new RcptSubDet_BUS();
        private int total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cthd.Visible = false;
                sumprice.Visible = false;
                BindGridViewgvRcptBuy();
            }
        }
        // Load data lên cho gvRcptBuy
        private void BindGridViewgvRcptBuy()
        {
            //gvRcptBuy.DataSource = rcptBuy.GetAll().ToList();
            //gvRcptBuy.DataBind();

            
            
            var src1 =
                (from r in rcpt.GetAll()
                 join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                 join s in shp.GetAll() on b.ShpId equals s.ShpId
                 join z in mer.GetAll() on s.MerId equals z.MerId 
                 join t in rcptbuystadet.GetAll() on b.RcptBuyId equals t.RcptBuyId
                 join e in rcptbuystastep.GetAll() on t.StepId equals e.StepId
                 where z.MerId == (MerchantSession.LoginMer)?.MerId
                 select new
                 {
                     b.RcptBuyId,
                     r.DateAdd,
                     r.DateEdit,
                     r.UsrAdd,
                     r.UsrEdit,
                     b.CusId,
                     s.ShpName,
                     z.MerId,
                     e.StepCont
                 }
                ).ToList();

            gvRcptBuy.DataSource = src1;
            gvRcptBuy.DataBind();
           
        }

        // Load data lên cho gvRcptBuyDet
        private void BindGridViewgvRcptBuyDet(int RcptBuyId)
        {
            cthd.Visible = true;
            sumprice.Visible = true;
            var src =
                (from r in rcpt.GetAll()
                 join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                 join d in rcptBuyDet.GetAll() on b.RcptBuyId equals d.RcptBuyId
                 join p in pro.GetAll() on d.ProId equals p.ProId
                 join s in shp.GetAll() on d.ShpId equals s.ShpId
                 join u in usr.GetAll() on b.CusId equals u.UsrId
                 where r.RcptId == RcptBuyId
                 select new
                 {
                     r.RcptId,
                     u.UsrName,
                     s.ShpName,
                     p.ProName,
                     Price = int.Parse(p.Price),
                     d.Quantity,
                     Subprice = int.Parse(p.Price) * d.Quantity
                 }
                ).ToList();
            gvRcptBuyDet.DataSource = src;
            total = src.Sum(m => Convert.ToInt32(m.Subprice));
            sumprice2.Text = total.ToString("#,##0");
            gvRcptBuyDet.DataBind();
        }
        /*
        protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRcptBuy.EditIndex = e.NewEditIndex;
            gvRcptBuy.DataBind();// your gridview binding function
        }
        */
        // Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in rcptBuy.GetAll().ToList()
                      where a.CusId.ToString().ContainsEx(search_key)
                            || a.RcptBuyId.ToString().ContainsEx(search_key)
                            || a.Rcpt.DateAdd != null && a.Rcpt.DateAdd.ToString().ContainsEx(search_key)
                            || a.Rcpt.DateEdit != null && a.Rcpt.DateEdit.ToString().ContainsEx(search_key)
                            || a.Rcpt.UsrAdd.ToString().ContainsEx(search_key)
                            || a.Rcpt.UsrEdit.ToString().ContainsEx(search_key)
                      select a).ToList();
            gvRcptBuy.DataSource = rs;
            gvRcptBuy.DataBind();
        }

        // Ràng buộc và thêm xóa sửa
        protected void gvBuy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvRcptBuy.EditIndex = rowIndex;
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "DeleteRow")
            {
                var result2 = rcptBuyDet.GetAll()
                    .FirstOrDefault(m => m.RcptBuyId == Convert.ToInt32(e.CommandArgument));
                var result = rcptBuy.GetAll().FirstOrDefault(m => m.RcptBuyId == Convert.ToInt32(e.CommandArgument));
                var result1 = (from c in rcpt.GetAll()
                               where c.RcptId == Convert.ToInt32(e.CommandArgument)
                               select c).FirstOrDefault();
                rcptBuyDet.Delete(result2);
                rcptBuy.Delete(result);
                rcpt.Delete(result1);
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvRcptBuy.EditIndex = -1;
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "UpdateRow")
            {
                var rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                var UsrEdit = ((TextBox)gvRcptBuy.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
                //var StepEdit = ((DropDownList)gvRcptBuy.Rows[rowIndex].FindControl("StepCont")).Text;
                // SỬA CODE Ở ĐÂY
                var result = (from c in rcptBuy.GetAll()
                              join a in rcptbuystadet.GetAll() on c.RcptBuyId equals a.RcptBuyId
                              join b in rcptbuystastep.GetAll() on a.StepId equals b.StepId
                              where c.RcptBuyId == Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();
                //var result1 = (from c in MyLibrary.RcptBuyStaDet_BUS.GetAll()
                 //              join a in rcptbuystadet.GetAll() on c.RcptBuyId equals a.RcptBuyId
                 //              join b in rcptbuystastep.GetAll() on a.StepId equals b.StepId
                 //              select c).FirstOrDefault();
                if (result != null)
                {
                    // SỬA CODE Ở ĐÂY
                    result.Rcpt.DateEdit = DateTime.Now;
                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
                    //result1.StepId = Convert.ToInt32(StepEdit);
                    //rcptbuystadet.Update(result1);
                    rcptBuy.Update(result);
                }

                gvRcptBuy.EditIndex = -1;
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "InsertRow")
            {
                // SỬA CODE Ở ĐÂY
                var dateAdd = DateTime.Now.ToString();
                var usrAdd = ((TextBox)gvRcptBuy.FooterRow.FindControl("InsertUsrAdd")).Text;
                var cusId = ((TextBox)gvRcptBuy.FooterRow.FindControl("InsertCusId")).Text;
                string usrEdit = null;
                if (usrEdit == null) usrEdit = "0";
                if (usrAdd == "") return;
                var rcpt1 = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = int.Parse(usrAdd),
                    UsrEdit = null
                };
                rcpt.Insert(rcpt1);
                var newRcptBuy = new RcptBuy
                {
                    RcptBuyId = rcpt.getMaxRcptId(),
                    CusId = int.Parse(cusId)
                };
                rcptBuy.Insert(newRcptBuy);
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "EInsertRow")
            {
                var dateAdd = DateTime.Now.ToString();
                var usrAdd = ((TextBox)gvRcptBuy.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
                var cusId = ((TextBox)gvRcptBuy.Controls[0].Controls[0].FindControl("EInsertCusId")).Text;
                string usrEdit = null;
                if (usrEdit == null) usrEdit = "0";
                if (usrAdd == "") return;
                var rcpt1 = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = int.Parse(usrAdd),
                    UsrEdit = null
                };
                rcpt.Insert(rcpt1);
                var newRcptBuy = new RcptBuy
                {
                    RcptBuyId = rcpt.getMaxRcptId(),
                    CusId = int.Parse(cusId)
                };
                rcptBuy.Insert(newRcptBuy);
                BindGridViewgvRcptBuy();
            }
        }

        // Sự kiện chọn rcpt trong rcptBuy
        protected void gvRcptBuy_SelectedIndexChanged(object sender, EventArgs e)
        {
            var rcptBuyId = int.Parse((gvRcptBuy.SelectedRow.FindControl("rcptbuyid") as Label).Text);
            BindGridViewgvRcptBuyDet(rcptBuyId);
        }

        // Gộp những dòng trùng
        protected void gvRcptBuyDet_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            var RowSpan = 2;
            for (var i = gvRcptBuyDet.Rows.Count - 2; i >= 0; i--)
            {
                var currRow = gvRcptBuyDet.Rows[i];
                var prevRow = gvRcptBuyDet.Rows[i + 1];
                if (currRow.Cells[0].Text == prevRow.Cells[2].Text)
                {
                    currRow.Cells[0].RowSpan = RowSpan;
                    prevRow.Cells[0].Visible = false;
                    RowSpan += 1;
                }
                else
                {
                    RowSpan = 2;
                }

                if (currRow.Cells[1].Text == prevRow.Cells[2].Text)
                {
                    currRow.Cells[1].RowSpan = RowSpan;
                    prevRow.Cells[1].Visible = false;
                    RowSpan += 1;
                }
                else
                {
                    RowSpan = 2;
                }
            }
        }

        protected void gvRcptBuy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("drpcategory1");
                    //bind dropdown-list
                    //DataTable dt = RcptBuyStaStep_BUS.GetData("Select StepCont from RcptBuyStaStep");
                    HiddenField hdnfld = (HiddenField)e.Row.FindControl("rcptBuyId1");
                    int rcptBuyId1 = Convert.ToInt32(hdnfld.Value);
                    //rcptBuyStaStep.GetAll()
                    int[] step = {1,2,6,7,8,11 };
                    int[] stepExist = MyLibrary.RcptBuyStaDet_BUS.GetAllByExist(rcptBuyId1, step);
                    int[] stepNew = step.Except(stepExist).ToArray();
                    ddList.DataSource = MyLibrary.RcptBuyStaStep_BUS.GetAllBy(stepNew);
                    ddList.DataTextField = "StepCont";
                    ddList.DataValueField = "StepId";
                    ddList.DataBind();

                    //DataRowView dr = e.Row.DataItem as DataRowView;
                    //ddList.SelectedItem.Text = dr["category_name"].ToString();
                    //ddList.SelectedValue = dr["StepCont"].ToString();
                }
            }
        }
    }
}