using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Mer : Page
    {
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptSub_BUS rcptsub = new RcptSub_BUS();
        private readonly RcptSubDet_BUS rcptsubdet = new RcptSubDet_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        private readonly Sub_BUS sub = new Sub_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        public string selectedValProp = "";
        public static List<RcptSub> lstViewTemp = new List<RcptSub>();
        private int total;

        // PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLvSub(); LoadDdlPropFilter(); 
            }
        }

        // Gridview RcptSub
        private void LoadLvSub()
        {
            lvRcptSub.DataSource = rcptsub.GetAll().ToList();
            lvRcptSub.DataBind();
            ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
        }

        public void LoadDdlPropFilter()
        {
            List<ListItem> items = new List<ListItem>();
            items.Add(new ListItem("-- Tất cả --", "All"));
            items.Add(new ListItem("Ngày đặt hàng", "DateAdd"));
            items.Add(new ListItem("Cửa hàng", "ShpName"));
            items.Add(new ListItem("Khách hàng", "CusName"));
            items.Sort(delegate (ListItem item1, ListItem item2) { return item1.Text.CompareTo(item2.Text); });
            ddlPropFilter.Items.AddRange(items.ToArray());
        }
        public void LoadShpName()
        {
            var rs = MyLibrary.Shp_Bus.GetAll();
            ddlPropFilterDet.DataSource = rs.ToList();
            ddlPropFilterDet.DataTextField = "ShpName";
            ddlPropFilterDet.DataValueField = "ShpId";
            ddlPropFilterDet.DataBind();
            ListItem item = ddlPropFilterDet.Items.FindByValue(String.Empty);
            if (item == null)
            {
                ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", String.Empty));
            }
            ddlPropFilterDet.SelectedIndex = 0;
        }

        public void LoadRcptBuyByShpName(int ShpId)
        {
            lvRcptSub.DataSource = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Mer.Shp.Select(m=>m.ShpId).FirstOrDefault() == ShpId).ToList();
            lvRcptSub.DataBind();
        }

        protected void lvRcptSub_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

        }

        protected void lvRcptSub_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvRcptSub_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName=="Sel")
            {
                int rcptSubId = int.Parse(e.CommandArgument.ToString());
                Server.Transfer("~/Admin/RcptSub_Det.aspx?RcptSubId=" + rcptSubId);
            }
        }

        protected void lvRcptSub_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void lbtnSort_Click(object sender, EventArgs e)
        {
            lstViewTemp.Clear();
            foreach (var item in MyLibrary.RcptSub_BUS.GetAll())
            {

                lstViewTemp.Add(item);
            }
            switch (SortList.SelectedValue)
            {
                case "DateAdd":
                    if (DirectionList.SelectedValue == "DESC") { lvRcptSub.DataSource = lstViewTemp.OrderByDescending(x => x.Rcpt.DateAdd).ToList(); lvRcptSub.DataBind(); }
                    else { lvRcptSub.DataSource = lstViewTemp.OrderBy(x => x.Rcpt.DateAdd).ToList(); lvRcptSub.DataBind(); }
                    break;
                case "RcptSubId":
                    if (DirectionList.SelectedValue == "DESC") { lvRcptSub.DataSource = lstViewTemp.OrderByDescending(x => x.RcptSubId).ToList(); lvRcptSub.DataBind(); }
                    else { lvRcptSub.DataSource = lstViewTemp.OrderBy(x => x.RcptSubId).ToList(); lvRcptSub.DataBind(); }
                    break;
                case "ShpName":
                    if (DirectionList.SelectedValue == "DESC") { lvRcptSub.DataSource = lstViewTemp.OrderByDescending(x => x.Mer.Shp.Select(m => m.ShpName).FirstOrDefault()).ToList(); lvRcptSub.DataBind(); }
                    else { lvRcptSub.DataSource = lstViewTemp.OrderBy(x => x.Mer.Shp.Select(m=>m.ShpName).FirstOrDefault()).ToList(); lvRcptSub.DataBind(); }
                    break;
                case "SumPrice":
                    if (DirectionList.SelectedValue == "DESC") { lvRcptSub.DataSource = lstViewTemp.OrderByDescending(x => MyLibrary.SumRcptSubPrice(x)).ToList(); lvRcptSub.DataBind(); }
                    else { lvRcptSub.DataSource = lstViewTemp.OrderBy(x => MyLibrary.SumRcptSubPrice(x)).ToList().ToList(); lvRcptSub.DataBind(); }
                    break;
                case "SumDay":
                    if (DirectionList.SelectedValue == "DESC") { lvRcptSub.DataSource = lstViewTemp.OrderByDescending(x => x.RcptSubDet.Select(m => m.Sub.DurDay).Sum()).ToList(); lvRcptSub.DataBind(); }
                    else { lvRcptSub.DataSource = lstViewTemp.OrderBy(x => x.RcptSubDet.Select(m => m.Sub.DurDay).Sum()).ToList().ToList(); lvRcptSub.DataBind(); }
                    break;
            }
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
                    LoadLvSub();
                    break;
                case "ShpName":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false; lbtnTim.Visible = false;
                    LoadShpName();
                    break;
                case "DateAdd":
                    ddlPropFilterDet.Visible = false;
                    datepicker.Visible = true; lbtnTim.Visible = true;
                    break;
            }
        }

        protected void lbtnTim_Click(object sender, EventArgs e)
        {
            DateTime s = Convert.ToDateTime(datepicker.Value);
            string date = s.ToString("MM/dd/yyyy");
            lvRcptSub.DataSource = MyLibrary.RcptSub_BUS.GetAll().Where(x => x.Rcpt.DateAdd.ToString("dd/MM/yyyy") == date).ToList();
            lvRcptSub.DataBind();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }
        public void TimKiem(string search_key)
        {
            var rs = (from a in MyLibrary.RcptSub_BUS.GetAll()
                      where a.Rcpt.Usr.UsrName.ToString().ContainsEx(search_key)
                            || a.RcptSubId.ToString().ContainsEx(search_key)
                            || a.Mer.Shp.Select(x=>x.ShpName).FirstOrDefault().ToString().ContainsEx(search_key)
                      select a).ToList();
            if (rs.Count != 0)
            {
                lvRcptSub.DataSource = rs;
                lvRcptSub.DataBind();
            }
            else MyLibrary.Show("Không có hóa đơn");
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
                LoadLvSub();
                ddlPropFilterDet.Items.RemoveAt(0);
            }
            else
            {
                switch (selectedValProp)
                {
                    case "ShpName":
                        LoadRcptBuyByShpName(selectedVal);
                        break;
                }
            }
        }

        //// Gridview RcptSubDet
        //        private void BindDetailsViewRcptSubDet(int RcptSubId)
        //        {
        //            cthd.Visible = true;
        //            sumprice.Visible = true;
        //            var src =
        //                (from r in rcpt.GetAll()
        //                    join s in rcptsub.GetAll() on r.RcptId equals s.RcptSubId
        //                    join d in rcptsubdet.GetAll() on s.RcptSubId equals d.RcptSubId
        //                    join sb in sub.GetAll() on d.SubId equals sb.SubId
        //                    join u in usr.GetAll() on d.RcptSub.MerId equals u.UsrId
        //                    join sp in shp.GetAll() on d.RcptSub.MerId equals sp.MerId
        //                    where r.RcptId == RcptSubId
        //                    select new
        //                    {
        //                        r.RcptId,
        //                        sp.ShpName,
        //                        u.UsrName,
        //                        sb.SubContent,
        //                        Price = int.Parse(sb.Price),
        //                        d.Quantity,
        //                        Days = sb.DurDay * d.Quantity,
        //                        Subprice = int.Parse(sb.Price) * d.Quantity
        //                    }
        //                ).ToList();
        //            gvRcptSubDet.DataSource = src;
        //            total = src.Sum(m => Convert.ToInt32(m.Subprice));
        //            sumprice2.Text = total.ToString("#,##0");
        //            gvRcptSubDet.DataBind();
        //        }

        //// Ràng buộc và chức năng thêm xóa sửa dữ liệu
        //        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        //        {
        //            if (e.CommandName == "EditRow")
        //            {
        //                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
        //                gvRcptSub.EditIndex = rowIndex;
        //                BindGridViewgvRcptSub();
        //            }
        //            else if (e.CommandName == "DeleteRow")
        //            {
        //                var result2 = rcptsubdet.GetAll()
        //                    .FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));
        //                var result = rcptsub.GetAll().FirstOrDefault(m => m.RcptSubId == Convert.ToInt32(e.CommandArgument));
        //                var result1 = (from c in rcpt.GetAll()
        //                    where c.RcptId == Convert.ToInt32(e.CommandArgument)
        //                    select c).FirstOrDefault();
        //                rcptsubdet.Delete(result2);
        //                rcptsub.Delete(result);
        //                rcpt.Delete(result1);
        //                BindGridViewgvRcptSub();
        //            }
        //            else if (e.CommandName == "CancelUpdate")
        //            {
        //                gvRcptSub.EditIndex = -1;
        //                BindGridViewgvRcptSub();
        //            }
        //            else if (e.CommandName == "UpdateRow")
        //            {
        //                var rowIndex = ((GridViewRow) ((LinkButton) e.CommandSource).NamingContainer).RowIndex;
        //                var UsrEdit = ((TextBox) gvRcptSub.Rows[rowIndex].FindControl("EditUsrEdit")).Text;
        //// SỬA CODE Ở ĐÂY
        //                var result = (from c in rcptsub.GetAll()
        //                    where c.RcptSubId == Convert.ToInt32(e.CommandArgument)
        //                    select c).FirstOrDefault();
        //                if (result != null)
        //                {
        //// SỬA CODE Ở ĐÂY
        //                    result.Rcpt.DateEdit = DateTime.Now;
        //                    result.Rcpt.UsrEdit = Convert.ToInt32(UsrEdit);
        //                    rcptsub.Update(result);
        //                }

        //                gvRcptSub.EditIndex = -1;
        //                BindGridViewgvRcptSub();
        //            }
        //            else if (e.CommandName == "InsertRow")
        //            {
        //// SỬA CODE Ở ĐÂY
        //                var dateAdd = DateTime.Now.ToString();
        //                var usrAdd = ((TextBox) gvRcptSub.FooterRow.FindControl("InsertUsrAdd")).Text;
        //                string usrEdit = null;
        //                if (usrEdit == null) usrEdit = "0";
        //                if (usrAdd == "") return;
        //                var rcpt1 = new Rcpt
        //                {
        //                    DateAdd = DateTime.Now,
        //                    DateEdit = null,
        //                    UsrAdd = int.Parse(usrAdd),
        //                    UsrEdit = null
        //                };
        //                rcpt.Insert(rcpt1);
        //                var newRcptSub = new RcptSub
        //                {
        //                    RcptSubId = rcpt.getMaxRcptId()
        //                };
        //                rcptsub.Insert(newRcptSub);
        //                BindGridViewgvRcptSub();
        //            }
        //            else if (e.CommandName == "EInsertRow")
        //            {
        //                var dateAdd = DateTime.Now.ToString();
        //                var usrAdd = ((TextBox) gvRcptSub.Controls[0].Controls[0].FindControl("EInsertUsrAdd")).Text;
        //                string usrEdit = null;
        //                if (usrEdit == null) usrEdit = "0";
        //                if (usrAdd == "") return;
        //                var rcpt1 = new Rcpt
        //                {
        //                    DateAdd = DateTime.Now,
        //                    DateEdit = null,
        //                    UsrAdd = int.Parse(usrAdd),
        //                    UsrEdit = null
        //                };
        //                rcpt.Insert(rcpt1);
        //                var newRcptSub = new RcptSub
        //                {
        //                    RcptSubId = rcpt.getMaxRcptId()
        //                };
        //                rcptsub.Insert(newRcptSub);
        //                BindGridViewgvRcptSub();
        //            }
        //        }

        //// Hàm gọi RcptSubDet
        //        protected void gvRcptSub_SelectedIndexChanged(object sender, EventArgs e)
        //        {
        //            var rcptSubId = int.Parse((gvRcptSub.SelectedRow.FindControl("rcptsubid") as Label).Text);
        //            BindDetailsViewRcptSubDet(rcptSubId);
        //        }

        //// Hàm dùng để gộp những dòng trùng
        //        protected void gvRcptSubDet_RowDataBound(object sender, GridViewRowEventArgs e)
        //        {
        //            var RowSpan = 2;
        //            for (var i = gvRcptSubDet.Rows.Count - 2; i >= 0; i--)
        //            {
        //                var currRow = gvRcptSubDet.Rows[i];
        //                var prevRow = gvRcptSubDet.Rows[i + 1];
        //                if (currRow.Cells[0].Text == prevRow.Cells[2].Text)
        //                {
        //                    currRow.Cells[0].RowSpan = RowSpan;
        //                    prevRow.Cells[0].Visible = false;
        //                    RowSpan += 1;
        //                }
        //                else
        //                {
        //                    RowSpan = 2;
        //                }

        //                if (currRow.Cells[2].Text == prevRow.Cells[2].Text)
        //                {
        //                    currRow.Cells[2].RowSpan = RowSpan;
        //                    prevRow.Cells[2].Visible = false;
        //                    RowSpan += 1;
        //                }
        //                else
        //                {
        //                    RowSpan = 2;
        //                }

        //                if (currRow.Cells[1].Text == prevRow.Cells[2].Text)
        //                {
        //                    currRow.Cells[1].RowSpan = RowSpan;
        //                    prevRow.Cells[1].Visible = false;
        //                    RowSpan += 1;
        //                }
        //                else
        //                {
        //                    RowSpan = 2;
        //                }
        //            }
        //        }

        //// Tìm kiếm
        //        protected void btnTimKiem_Click(object sender, EventArgs e)
        //        {
        //            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        //        }

        //        public void TimKiem(string search_key)
        //        {
        //            var rs = (from a in rcptsub.GetAll().ToList()
        //                where a.RcptSubId.ToString().ContainsEx(search_key)
        //                      || a.Rcpt.UsrEdit.ToString().ContainsEx(search_key)
        //                      || a.Rcpt.UsrAdd.ToString().ContainsEx(search_key)
        //                      || a.Rcpt.DateAdd != null && a.Rcpt.DateAdd.ToString().ContainsEx(search_key)
        //                      || a.Rcpt.DateEdit != null && a.Rcpt.DateEdit.ToString().ContainsEx(search_key)
        //                select a).ToList();
        //            gvRcptSub.DataSource = rs;
        //            gvRcptSub.DataBind();
        //        }
    }
}