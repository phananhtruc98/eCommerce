using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Cus : Page
    {
        int total = 0;
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        private readonly Pro_BUS pro = new Pro_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
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
            gvRcptBuy.DataSource = rcptBuy.GetAll().ToList();
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
                 RcptId = r.RcptId,
                 UsrName = u.UsrName,
                 ShpName = s.ShpName,
                 ProName = p.ProName,
                 Price = Int32.Parse(p.Price),
                 Quantity = d.Quantity,
                 Subprice = Int32.Parse(p.Price) * d.Quantity
             }
                                       ).ToList();
            gvRcptBuyDet.DataSource = src;
            total = src.Sum(m => Convert.ToInt32(m.Subprice));
            sumprice2.Text = total.ToString("#,##0");
            gvRcptBuyDet.DataBind();
        }

        // Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in rcptBuy.GetAll().ToList()
                      where a.CusId.ToString().ContainsEx((search_key))
                            || a.RcptBuyId.ToString().ContainsEx(search_key)
                            || (a.Rcpt.DateAdd != null && a.Rcpt.DateAdd.ToString().ContainsEx(search_key))
                            || (a.Rcpt.DateEdit != null && a.Rcpt.DateEdit.ToString().ContainsEx(search_key))
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
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                gvRcptBuy.EditIndex = rowIndex;
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "DeleteRow")
            {
                RcptBuyDet result2 = rcptBuyDet.GetAll().FirstOrDefault(m => m.RcptBuyId == Convert.ToInt32(e.CommandArgument));

                RcptBuy result = rcptBuy.GetAll().FirstOrDefault(m => m.RcptBuyId == Convert.ToInt32(e.CommandArgument));

                Rcpt result1 = (from c in rcpt.GetAll()
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
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string UsrEdit = ((TextBox)gvRcptBuy.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
                // SỬA CODE Ở ĐÂY
                RcptBuy result = (from c in rcptBuy.GetAll()
                                  where c.RcptBuyId == Convert.ToInt32(e.CommandArgument)
                                  select c).FirstOrDefault();
                if (result != null)
                {
                    // SỬA CODE Ở ĐÂY

                    result.Rcpt.DateEdit = DateTime.Now;
                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
                    rcptBuy.Update(result);
                }

                gvRcptBuy.EditIndex = -1;
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "InsertRow")
            {
                // SỬA CODE Ở ĐÂY
                string dateAdd = DateTime.Now.ToString();
                string usrAdd = ((TextBox)gvRcptBuy.FooterRow.FindControl("InsertUsrAdd")).Text;
                string cusId = ((TextBox)gvRcptBuy.FooterRow.FindControl("InsertCusId")).Text;
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
                RcptBuy newRcptBuy = new RcptBuy
                {
                    RcptBuyId = rcpt.getMaxRcptId(),
                    CusId = Int32.Parse(cusId)
                };

                rcptBuy.Insert(newRcptBuy);
                BindGridViewgvRcptBuy();
            }
            else if (e.CommandName == "EInsertRow")
            {
                string dateAdd = DateTime.Now.ToString();
                string usrAdd = ((TextBox)gvRcptBuy.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
                string cusId = ((TextBox)gvRcptBuy.Controls[0].Controls[0].FindControl("EInsertCusId")).Text;
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
                RcptBuy newRcptBuy = new RcptBuy
                {
                    RcptBuyId = rcpt.getMaxRcptId(),
                    CusId = Int32.Parse(cusId)
                };

                rcptBuy.Insert(newRcptBuy);

                BindGridViewgvRcptBuy();
            }
        }

        // Sự kiện chọn rcpt trong rcptBuy
        protected void gvRcptBuy_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rcptBuyId = Int32.Parse((gvRcptBuy.SelectedRow.FindControl("rcptbuyid") as Label).Text);
            BindGridViewgvRcptBuyDet(rcptBuyId);
        }

        // Gộp những dòng trùng
        protected void gvRcptBuyDet_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            int RowSpan = 2;
            for (int i = gvRcptBuyDet.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = gvRcptBuyDet.Rows[i];
                GridViewRow prevRow = gvRcptBuyDet.Rows[i + 1];
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

    }
}