﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Admin
{
    public partial class ManageReceipt_Cus : Page
    {
        public static List<RcptBuy> lstViewTemp = new List<RcptBuy>();
        private readonly Pro_BUS pro = new Pro_BUS();
        private readonly Rcpt_BUS rcpt = new Rcpt_BUS();
        private readonly RcptBuy_BUS rcptBuy = new RcptBuy_BUS();
        private readonly RcptBuyDet_BUS rcptBuyDet = new RcptBuyDet_BUS();
        private readonly Shp_BUS shp = new Shp_BUS();
        private readonly Usr_BUS usr = new Usr_BUS();
        public string selectedValProp = "";


        // Load data lên cho gvRcptBuyDet
        private void BindGridViewgvRcptBuyDet(int RcptBuyId)
        {
            //cthd.Visible = true;
            //sumprice.Visible = true;
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
          
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        protected void ddlPropFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            var item = ddlPropFilterDet.Items.FindByValue(string.Empty);
            var selectedVal = ddlPropFilter.SelectedValue;
            selectedValProp = selectedVal;
            switch (selectedVal)
            {
                case "All":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false;
                    lbtnTim.Visible = false;
                    ddlPropFilterDet.Items.Clear();
                    LoadRcptBuy();
                    break;
                case "ShpName":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false;
                    lbtnTim.Visible = false;
                    LoadShpName();
                    break;
                case "CusName":
                    ddlPropFilterDet.Visible = true;
                    datepicker.Visible = false;
                    lbtnTim.Visible = false;
                    LoadCusName();
                    break;
                case "DateAdd":
                    ddlPropFilterDet.Visible = false;
                    datepicker.Visible = true;
                    lbtnTim.Visible = true;
                    break;
            }
        }


        protected void ddlPropFilterDet_SelectedIndexChanged(object sender, EventArgs e)
        {
            var props = ddlPropFilter;
            var selectedValProp = props.SelectedValue;
            var selectedVal = 0;
            if (ddlPropFilterDet.SelectedValue == "")
                selectedVal = 0;
            else
                selectedVal = int.Parse(ddlPropFilterDet.SelectedValue);
            if (selectedVal == 0)
            {
                LoadRcptBuy();
                ddlPropFilterDet.Items.RemoveAt(0);
            }
            else
            {
                switch (selectedValProp)
                {
                    case "ShpName":
                        LoadRcptBuyByShpName(selectedVal);

                        break;
                    case "CusName":
                        LoadRcptBuyByCusName(selectedVal);
                        break;
                }
            }
        }

        // Sắp xếp 
        protected void lbtnSort_Click(object sender, EventArgs e)
        {
            lstViewTemp.Clear();
            foreach (var item in MyLibrary.RcptBuy_BUS.GetAll()) lstViewTemp.Add(item);
            switch (SortList.SelectedValue)
            {
                case "DateAdd":
                    if (DirectionList.SelectedValue == "DESC")
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderByDescending(x => x.Rcpt.DateAdd).ToList();
                        lvRcptBuy.DataBind();
                    }
                    else
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderBy(x => x.Rcpt.DateAdd).ToList();
                        lvRcptBuy.DataBind();
                    }

                    break;
                case "RcptBuyId":
                    if (DirectionList.SelectedValue == "DESC")
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderByDescending(x => x.RcptBuyId).ToList();
                        lvRcptBuy.DataBind();
                    }
                    else
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderBy(x => x.RcptBuyId).ToList();
                        lvRcptBuy.DataBind();
                    }

                    break;
                case "ShpName":
                    if (DirectionList.SelectedValue == "DESC")
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderByDescending(x => x.Shp.ShpName).ToList();
                        lvRcptBuy.DataBind();
                    }
                    else
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderBy(x => x.Shp.ShpName).ToList();
                        lvRcptBuy.DataBind();
                    }

                    break;
                case "CusName":
                    if (DirectionList.SelectedValue == "DESC")
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderByDescending(x => x.Cus.Usr.UsrName).ToList();
                        lvRcptBuy.DataBind();
                    }
                    else
                    {
                        lvRcptBuy.DataSource = lstViewTemp.OrderBy(x => x.Cus.Usr.UsrName).ToList();
                        lvRcptBuy.DataBind();
                    }

                    break;
            }
        }

        protected void lbtnTim_Click(object sender, EventArgs e)
        {
            var s = Convert.ToDateTime(datepicker.Value);
            var date = s.ToString("MM/dd/yyyy");
            lvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll()
                .Where(x => x.Rcpt.DateAdd.ToString("dd/MM/yyyy") == date).ToList();
            lvRcptBuy.DataBind();
        }

        public void LoadCusName()
        {
            var rs = MyLibrary.RcptBuy_BUS.GetAll().Select(x => x.Cus.Usr).Distinct();
            ddlPropFilterDet.DataSource = rs.ToList();
            ddlPropFilterDet.DataTextField = "UsrName";
            ddlPropFilterDet.DataValueField = "UsrId";
            ddlPropFilterDet.DataBind();
            ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", string.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
        }

        public void LoadDdlPropFilter()
        {
            var items = new List<ListItem>();
            items.Add(new ListItem("-- Tất cả --", "All"));
            items.Add(new ListItem("Ngày đặt hàng", "DateAdd"));
            items.Add(new ListItem("Cửa hàng", "ShpName"));
            items.Add(new ListItem("Khách hàng", "CusName"));
            items.Sort(delegate(ListItem item1, ListItem item2) { return item1.Text.CompareTo(item2.Text); });
            ddlPropFilter.Items.AddRange(items.ToArray());
        }

        public void LoadRcptBuy()
        {
            lvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll().ToList();
            lvRcptBuy.DataBind();
            ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", string.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
        }

        public void LoadRcptBuyByCusName(int CusId)
        {
            lvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.Cus.Usr.UsrId == CusId).ToList();
            lvRcptBuy.DataBind();
        }

        public void LoadRcptBuyByShpName(int ShpId)
        {
            lvRcptBuy.DataSource = MyLibrary.RcptBuy_BUS.GetAll().Where(x => x.Shp.ShpId == ShpId).ToList();
            lvRcptBuy.DataBind();
        }

        public void LoadShpName()
        {
            var rs = MyLibrary.RcptBuy_BUS.GetAll().Select(x => x.Shp).Distinct();
            ddlPropFilterDet.DataSource = rs.ToList();
            ddlPropFilterDet.DataTextField = "ShpName";
            ddlPropFilterDet.DataValueField = "ShpId";
            ddlPropFilterDet.DataBind();
            var item = ddlPropFilterDet.Items.FindByValue(string.Empty);
            if (item == null) ddlPropFilterDet.Items.Insert(0, new ListItem("--Tất cả--", string.Empty));
            ddlPropFilterDet.SelectedIndex = 0;
        }


        protected void lvRcptBuy_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Sel")
            {
                var rcptBuyId = int.Parse(e.CommandArgument.ToString());
                var staId = MyLibrary.RcptBuyStaDet_BUS.GetMaxExist(rcptBuyId).StepId;
                Response.Redirect("~/Admin/RcptBuy_Det.aspx?RcptBuyId=" + rcptBuyId + "&Sta=" + staId);
            }

            if (e.CommandName == "Sort")
            {
            }
        }

        protected void lvRcptBuy_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
            }
        }

        protected void lvRcptBuy_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            lbtnSort_Click(null, null);
        }

        // Chi tiết hóa đơn
        protected void lvRcptBuy_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRcptBuy();
                LoadDdlPropFilter();
            }
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in rcptBuy.GetAll().ToList()
                where a.Cus.Usr.UsrName.ToString().ContainsEx(search_key)
                      || a.RcptBuyId.ToString().ContainsEx(search_key)
                      || a.Shp.ShpName.ToString().ContainsEx(search_key)
                select a).ToList();
            if (rs.Count != 0)
            {
                lvRcptBuy.DataSource = rs;
                lvRcptBuy.DataBind();
            }
            else
            {
                MyLibrary.Show("Không có hóa đơn");
            }
        }
    }
}