using System;
using System.Collections.Generic;
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
        public string selectedValProp = "";
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
                gvRcptBuy.PageSize = 100;
                LoadDdlPropFilter();
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
            var src1 = (from r in MyLibrary.Rcpt_BUS.GetAll()
                        join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                        join i in MyLibrary.Usr_BUS.GetAll() on b.CusId equals i.UsrId
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
                            i.UsrName,
                            s.ShpName,
                            z.MerId,
                            e.StepId,
                            e.StepCont
                        });
            //var distinct = src1.DistinctBy(i => i.RcptBuyId);
            gvRcptBuy.DataSource = src1.DistinctBy(i => i.RcptBuyId).ToList();
            gvRcptBuy.DataBind();
            ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
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

        

        public void TimKiem(string search_key)
        {

            var rs = (from r in MyLibrary.Rcpt_BUS.GetAll()
                      join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                      join i in MyLibrary.Usr_BUS.GetAll() on b.CusId equals i.UsrId
                      join s in shp.GetAll() on b.ShpId equals s.ShpId
                      join z in mer.GetAll() on s.MerId equals z.MerId
                      join t in rcptbuystadet.GetAll() on b.RcptBuyId equals t.RcptBuyId
                      join e in rcptbuystastep.GetAll() on t.StepId equals e.StepId
                      where i.UsrName.ToString().ContainsEx(search_key)
                            || b.RcptBuyId.ToString().ContainsEx(search_key)
                            || r.DateAdd != null && r.DateAdd.ToString().ContainsEx(search_key)
                            || r.DateEdit != null && r.DateEdit.ToString().ContainsEx(search_key)
                            || s.ShpName.ToString().ContainsEx(search_key)
                            || e.StepId.ToString().ContainsEx(search_key)
                            || e.StepCont.ToString().ContainsEx(search_key)
                      select new
                      {
                          b.RcptBuyId,
                          r.DateAdd,
                          r.DateEdit,
                          r.UsrAdd,
                          r.UsrEdit,
                          i.UsrName,
                          s.ShpName,
                          z.MerId,
                          e.StepId,
                          e.StepCont
                      });
            gvRcptBuy.DataSource = rs.DistinctBy(i => i.RcptBuyId).ToList();
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
            // Cập Nhập 
            else if (e.CommandName == "UpdateRow")
            {
                GridViewRow rowSelect = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                int rowIndex = Convert.ToInt32(rowSelect.RowIndex);
                HiddenField hdnfld = (HiddenField)gvRcptBuy.Rows[rowIndex].FindControl("StepId");
                int stepId = Convert.ToInt32(hdnfld.Value);

                var result = (from c in rcptBuy.GetAll()
                              join z in rcptbuystadet.GetAll() on c.RcptBuyId equals z.RcptBuyId
                              join b in rcptbuystastep.GetAll() on z.StepId equals b.StepId
                              where c.RcptBuyId == Convert.ToInt32(e.CommandArgument)
                              select c).FirstOrDefault();

                var result1 = (from c in MyLibrary.RcptBuyStaDet_BUS.GetAll()
                               join z in rcptbuystadet.GetAll() on c.RcptBuyId equals z.RcptBuyId
                               join b in rcptbuystastep.GetAll() on z.StepId equals b.StepId
                               join d in rcptBuy.GetAll() on c.RcptBuyId equals d.RcptBuyId
                               where c.RcptBuyId == Convert.ToInt32(e.CommandArgument)
                               select c).FirstOrDefault();
                // lấy rcptbuyid , lấy ra staid, thêm 1 dòng với StepId mới 
                if (result != null)
                {
                    result.Rcpt.DateEdit = DateTime.Now;

                    // Vào trong RcptBuy lấy ra RcptBuyId để vào RcptBuyStaDet và thêm vào StepId
                    RcptBuy rb = MyLibrary.RcptBuy_BUS.GetAll().FirstOrDefault(m => m.RcptBuyId == Convert.ToInt32(e.CommandArgument));
                    RcptBuyStaDet rbsd = MyLibrary.RcptBuyStaDet_BUS.GetAll().FirstOrDefault(c => c.StepId == stepId);
                    //rb.RcptBuyStaDet = rbsd;

                    //result1.StepId = stepId;
                    //result1.RcptBuySta = null;
                    //result1.RcptBuyStaStep = null;
                    //result1.RcptBuySta = null;
                    RcptBuyStaDet rcptBuyStaDet = new RcptBuyStaDet()
                    {
                        StaId = result1.StaId,
                        RcptBuyId = result1.RcptBuyId,
                        StepId = stepId,
                        AddDate = DateTime.Now
                    };

                    if (stepId == 2)
                    {
                        MyLibrary.RcptBuy_BUS.RenewProDetQty(rb, "decrease");
                    }
                    int[] increaseStep = new int[] { 8, 9, 10, 11 };
                    if (increaseStep.Contains(stepId))
                    {
                        MyLibrary.RcptBuy_BUS.RenewProDetQty(rb, "increase");
                    }
                    MyLibrary.RcptBuyStaDet_BUS.Insert(rcptBuyStaDet);
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
            //BindGridViewgvRcptBuyDet(rcptBuyId);
            int staId = MyLibrary.RcptBuyStaDet_BUS.GetMaxExist(rcptBuyId).StepId;
            Response.Redirect("~/Merchant/Merchant_Rcpt_Det.aspx?RcptBuyId=" + rcptBuyId + "&Sta=" + staId);
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

        //Hàm xuất những bước còn lại chưa đi tới của tình trạng
        protected void gvRcptBuy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    HiddenField hdnfld = (HiddenField)e.Row.FindControl("rcptBuyId1");
                    HiddenField hdnfldStepId = (HiddenField)e.Row.FindControl("StepId");
                    DropDownList ddList = (DropDownList)e.Row.FindControl("drpcategory1");
                    //bind dropdown-list
                    //DataTable dt = RcptBuyStaStep_BUS.GetData("Select StepCont from RcptBuyStaStep");
                    int rcptBuyId1 = Convert.ToInt32(hdnfld.Value);
                    int[] step = { 1, 2, 4, 6, 7, 8 };
                    int[] stepExist = MyLibrary.RcptBuyStaDet_BUS.GetAllByExist(rcptBuyId1, step);
                    int[] stepNew = step.Except(stepExist).ToArray();
                    ddList.DataSource = MyLibrary.RcptBuyStaStep_BUS.GetAllBy(stepNew);
                    ddList.DataTextField = "StepCont";
                    ddList.DataValueField = "StepId";
                    ddList.DataBind();
                    if (ddList.Items.Count > 0)
                        hdnfldStepId.Value = ddList.SelectedValue;
                    else
                    {
                        ddList.Visible = false;
                    }
                }
            }
        }

        protected void drpcategory1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList drl = (DropDownList)sender;
            GridViewRow gvr = (GridViewRow)drl.NamingContainer;
            HiddenField hdf = (HiddenField)gvr.FindControl("StepId");
            hdf.Value = (string)drl.SelectedValue;
        }



        protected void ddlPropFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem item = ddlPropFilterDet.Items.FindByValue(String.Empty);
            string selectedVal = ddlPropFilter.SelectedValue;
            selectedValProp = selectedVal;
            switch (selectedVal)
            {
                case "All":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false;
                    lbtnTim.Visible = false;
                    ddlPropFilterDet.Items.Clear();
                    BindGridViewgvRcptBuy();
                    break;
                case "StepCont":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false; lbtnTim.Visible = false;
                    //LoadStepCont();
                    break;
                case "CusName":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false; lbtnTim.Visible = false;
                    LoadCusName();
                    break;
                case "DateAdd":
                    ddlPropFilterDet.Visible = false;
                    datepicker.Visible = true; lbtnTim.Visible = true;
                    break;

            }
        }
        public void LoadRcptBuy()
        {
            gvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll().ToList();
            gvRcptBuy.DataBind();
            ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
        }
        /// <summary>
        /// ///////////////////////////////////////////
        /// </summary>
        public void LoadStepCont()
        {
            var rs = MyLibrary.RcptBuyStaStep_BUS.GetAll();
            ddlPropFilterDet.DataSource = rs.ToList();
            ddlPropFilterDet.DataTextField = "StepCont";
            ddlPropFilterDet.DataValueField = "StepId";
            ddlPropFilterDet.DataBind();
            ListItem item = ddlPropFilterDet.Items.FindByValue(String.Empty);
            if (item == null)
            {
                ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            }
            ddlPropFilterDet.SelectedIndex = 0;
        }
        public void LoadCusName()
        {
            var rs = MyLibrary.RcptBuy_BUS.GetAll().Select(x => x.Cus.Usr).Distinct();
            ddlPropFilterDet.DataSource = rs.ToList();
            ddlPropFilterDet.DataTextField = "UsrName";
            ddlPropFilterDet.DataValueField = "UsrId";
            ddlPropFilterDet.DataBind();
            ListItem item = ddlPropFilterDet.Items.FindByValue(String.Empty);
            if (item == null)
            {
                ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            }
            ddlPropFilterDet.SelectedIndex = 0;
        }
        protected void lbtnTim_Click(object sender, EventArgs e)
        {
            DateTime s = Convert.ToDateTime(datepicker.Value);
            string date = s.ToString("MM/dd/yyyy");
            gvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.Rcpt.DateAdd.ToString("dd/MM/yyyy") == date).ToList();
            gvRcptBuy.DataBind();
        }
        protected void ddlPropFilterDet_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList props = ddlPropFilter;
            string selectedValProp = props.SelectedValue;
            int selectedVal = 0;
            if (ddlPropFilterDet.SelectedValue == "") { selectedVal = 0; }
            else { selectedVal = Int32.Parse(ddlPropFilterDet.SelectedValue); }
            if (selectedVal == 0)
            {
                BindGridViewgvRcptBuy();
                ddlPropFilterDet.Items.RemoveAt(0);
            }
            else
            {
                switch (selectedValProp)
                {
                    case "StepCont":
                        LoadRcptBuyByStepCont(selectedVal);
                        break;
                    case "CusName":
                        LoadRcptBuyByCusName(selectedVal);
                        break;
                }
            }
        }
        public void LoadRcptBuyByStepCont(int stepId)
        {
            var src1 = (from r in MyLibrary.Rcpt_BUS.GetAll()
                        join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                        join i in MyLibrary.Usr_BUS.GetAll() on b.CusId equals i.UsrId
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
                            i.UsrName,
                            i.UsrId,
                            s.ShpName,
                            z.MerId,
                            e.StepId,
                            e.StepCont
                        });
            gvRcptBuy.DataSource = src1.Where(x => x.StepId == stepId).ToList();
            gvRcptBuy.DataBind();
        }
        public void LoadRcptBuyByCusName(int CusId)
        {
            var src1 = (from r in MyLibrary.Rcpt_BUS.GetAll()
                        join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
                        join i in MyLibrary.Usr_BUS.GetAll() on b.CusId equals i.UsrId
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
                            i.UsrName,
                            i.UsrId,
                            s.ShpName,
                            z.MerId,
                            e.StepId,
                            e.StepCont
                        });
            gvRcptBuy.DataSource = src1.DistinctBy(i => i.RcptBuyId).Where(x => x.UsrId == CusId).ToList();
            gvRcptBuy.DataBind();
        }

        //Tìm kiếm
        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }
        public void LoadDdlPropFilter()
        {
            List<ListItem> items = new List<ListItem>();
            items.Add(new ListItem("-- Tất cả --", "All"));
            items.Add(new ListItem("Ngày đặt hàng", "DateAdd"));
            items.Add(new ListItem("Tình Trạng Đơn", "StepCont"));
            items.Add(new ListItem("Khách hàng", "CusName"));
            items.Sort(delegate (ListItem item1, ListItem item2) { return item1.Text.CompareTo(item2.Text); });
            ddlPropFilter.Items.AddRange(items.ToArray());
        }

        protected void gvRcptBuy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            gvRcptBuy.PageIndex = e.NewPageIndex;
            
            BindGridViewgvRcptBuy();
        }

        //protected void Datagrid1_SortCommand(object source, DataGridSortCommandEventArgs e)
        //{

        //    DataTable dt;
        //    var src1 = (from r in MyLibrary.Rcpt_BUS.GetAll()
        //                join b in rcptBuy.GetAll() on r.RcptId equals b.RcptBuyId
        //                join i in MyLibrary.Usr_BUS.GetAll() on b.CusId equals i.UsrId
        //                join s in shp.GetAll() on b.ShpId equals s.ShpId
        //                join z in mer.GetAll() on s.MerId equals z.MerId
        //                join t in rcptbuystadet.GetAll() on b.RcptBuyId equals t.RcptBuyId
        //                join l in rcptbuystastep.GetAll() on t.StepId equals l.StepId
        //                where z.MerId == (MerchantSession.LoginMer)?.MerId
        //                select new
        //                {
        //                    b.RcptBuyId,
        //                    r.DateAdd,
        //                    r.DateEdit,
        //                    r.UsrAdd,
        //                    r.UsrEdit,
        //                    i.UsrName,
        //                    i.UsrId,
        //                    s.ShpName,
        //                    z.MerId,
        //                    l.StepId,
        //                    l.StepCont
        //                });
        //    dt = src1.AsEnumerable();
        //    {
        //        string SortDir = string.Empty;
        //        if (dir == SortDirection.Ascending)
        //        {
        //            dir = SortDirection.Descending;
        //            SortDir = "Desc";
        //        }
        //        else
        //        {
        //            dir = SortDirection.Ascending;
        //            SortDir = "Asc";
        //        }
        //        DataView sortedView = new DataView(dt);
        //        sortedView.Sort = e.SortExpression + " " + SortDir;
        //        gvRcptBuy.DataSource = sortedView;
        //        gvRcptBuy.DataBind();
        //    }
        //}

        //protected SortDirection dir
        //{
        //    get
        //    {
        //        if (ViewState["dirState"] == null)
        //        {
        //            ViewState["dirState"] = SortDirection.Ascending;
        //        }
        //        return (SortDirection)ViewState["dirState"];
        //    }
        //    set
        //    {
        //        ViewState["dirState"] = value;
        //    }
        //}
    }
}