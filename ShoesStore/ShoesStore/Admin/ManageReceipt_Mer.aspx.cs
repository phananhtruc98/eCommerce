using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Mer : Page
    {

        int total = 0;
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptSub_BUS rcptsub = new RcptSub_BUS();
        private readonly RcptSubDet_BUS rcptsubdet = new RcptSubDet_BUS();
        private readonly Sub_BUS sub = new Sub_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cthd.Visible = false;
                BindGridViewgvRcptSub();

            }
        }

        // Gridview RcptSub
        private void BindGridViewgvRcptSub()
        {
            gvRcptSub.DataSource = rcptsub.GetAll().ToList();
            gvRcptSub.DataBind();
        }

        // Gridview RcptSubDet
        private void BindDetailsViewRcptSubDet(int RcptSubId)
        {
            cthd.Visible = true;
            var src=
            (from r in rcpt.GetAll()
                                       join s in rcptsub.GetAll() on r.RcptId equals s.RcptSubId
                                       join d in rcptsubdet.GetAll() on s.RcptSubId equals d.RcptSubId
                                       join sb in sub.GetAll() on d.SubId equals sb.SubId
                                       join u in usr.GetAll() on d.MerId equals u.UsrId
                                       join sp in shp.GetAll() on d.MerId equals sp.MerId
                                       where r.RcptId == RcptSubId
                                       select new
                                       {
                                           RcptId = r.RcptId,
                                           ShpName = sp.ShpName,
                                           UsrName = u.UsrName,
                                           SubContent = sb.SubContent,
                                           Price = sb.Price,
                                           Quantity = d.Quantity,
                                           Days = sb.DurDay * d.Quantity,
                                           Subprice = Int32.Parse(sb.Price) * d.Quantity
                                       }
                                       ).ToList();
            gvRcptSubDet.DataSource = src;
            total = src.Sum(m => Convert.ToInt32(m.Subprice));
            sumprice2.Text = total.ToString();
            gvRcptSubDet.DataBind();
            sumPrice();
        }
        // Ràng buộc và chức năng thêm xóa sửa dữ liệu
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvRcptSub.EditIndex = rowIndex;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "DeleteRow")
            {
                RcptSubDet result2 = rcptsubdet.GetAll().FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));

                RcptSub result = rcptsub.GetAll().FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));

                Rcpt result1 = (from c in rcpt.GetAll()
                                where c.RcptId == Convert.ToInt32(e.CommandArgument)
                                select c).FirstOrDefault();
                rcptsubdet.Delete(result2);
                rcptsub.Delete(result);
                rcpt.Delete(result1);
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                gvRcptSub.EditIndex = -1;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string UsrEdit = ((TextBox)gvRcptSub.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
                // SỬA CODE Ở ĐÂY
                RcptSub result = (from c in rcptsub.GetAll()
                                  where c.RcptSubId == Convert.ToInt32(e.CommandArgument)
                                  select c).FirstOrDefault();
                if (result != null)
                {
                    // SỬA CODE Ở ĐÂY

                    result.Rcpt.DateEdit = DateTime.Now;
                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
                    rcptsub.Update(result);
                }

                gvRcptSub.EditIndex = -1;
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "InsertRow")
            {
                // SỬA CODE Ở ĐÂY
                string dateAdd = DateTime.Now.ToString();
                string usrAdd = ((TextBox)gvRcptSub.FooterRow.FindControl("InsertUsrAdd")).Text;
                string usrEdit = null;
                if (usrEdit == null)
                {
                    usrEdit = "0";
                }

                if (usrAdd == "")
                {
                    return;
                }


                Rcpt rcpt1 = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = Int32.Parse(usrAdd),
                    UsrEdit = null
                };

                rcpt.Insert(rcpt1);
                RcptSub newRcptSub = new RcptSub
                {
                    RcptSubId = rcpt.getMaxRcptId()
                };

                rcptsub.Insert(newRcptSub);
                BindGridViewgvRcptSub();
            }
            else if (e.CommandName == "EInsertRow")
            {
                string dateAdd = DateTime.Now.ToString();
                string usrAdd = ((TextBox)gvRcptSub.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
                string usrEdit = null;
                if (usrEdit == null)
                {
                    usrEdit = "0";
                }

                if (usrAdd == "")
                {
                    return;
                }


                Rcpt rcpt1 = new Rcpt
                {
                    DateAdd = DateTime.Now,
                    DateEdit = null,
                    UsrAdd = Int32.Parse(usrAdd),
                    UsrEdit = null
                };

                rcpt.Insert(rcpt1);
                RcptSub newRcptSub = new RcptSub
                {
                    RcptSubId = rcpt.getMaxRcptId()
                };

                rcptsub.Insert(newRcptSub);

                BindGridViewgvRcptSub();
            }
        }
        
        // Hàm gọi RcptSubDet
        protected void gvRcptSub_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rcptSubId = Int32.Parse((gvRcptSub.SelectedRow.FindControl("rcptsubid") as Label).Text);
            BindDetailsViewRcptSubDet(rcptSubId);
        }

        // Hàm dùng để gộp những dòng trùng
        protected void gvRcptSubDet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int RowSpan = 2;
            for (int i = gvRcptSubDet.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = gvRcptSubDet.Rows[i];
                GridViewRow prevRow = gvRcptSubDet.Rows[i + 1];
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
                if (currRow.Cells[2].Text == prevRow.Cells[2].Text)
                {
                    currRow.Cells[2].RowSpan = RowSpan;
                    prevRow.Cells[2].Visible = false;
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
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    for(int i = 0; i < 8; i++)
            //    {
            //        if (e.Row.Cells[i].Text != "")
            //        {
            //            total = total + Int32.Parse(e.Row.Cells[i].Text);
            //        }
            //    }
            //}
        }

        public void sumPrice()
        {
            //sumprice2.Text = total.ToString();
        }

        protected void gvRcptSubDet_DataBound(object sender, EventArgs e)
        {
        }
    }
}