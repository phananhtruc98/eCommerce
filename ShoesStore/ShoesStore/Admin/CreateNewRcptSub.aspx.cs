using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.MyExtensions;
namespace ShoesStore.Admin
{
    public partial class CreateNewRcptSub : System.Web.UI.Page
    {

        private static List<ListViewItem> lstSub = new List<ListViewItem>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                LoadTableSub();
                LoadDdlMerName();

            }
        }

        public void LoadDdlMerName()
        {
            var rs = (from u in MyLibrary.Usr_BUS.GetAll()
                      join m in MyLibrary.Mer_BUS.GetAll() on u.UsrId equals m.MerId
                      select new
                      {
                          UsrName = u.UsrName,
                          UsrId = u.UsrId
                      }).ToList();
            ddtMerName.DataSource = rs;
            ddtMerName.DataTextField = "UsrName";
            ddtMerName.DataValueField = "UsrId";
            ddtMerName.DataBind();
         
        }



        // View 1
        public void LoadTableSub()
        {
            lvSub.DataSource = MyLibrary.Sub_BUS.GetAll();
            lvSub.DataBind();
        }

        protected void lvSub_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            ListViewItem rs = lvSub.Items[Int32.Parse(e.CommandArgument.ToString())];
            if (lstSub.Any(x => ((HiddenField)x.FindControl("hdfSubId")).Value == ((HiddenField)rs.FindControl("hdfSubId")).Value))
            {
                int slThem = Int32.Parse(((TextBox)rs.FindControl("Qty")).Text);
                int SubId = Int32.Parse(((HiddenField)rs.FindControl("hdfSubId")).Value);
                int slDaThem = Int32.Parse(lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == SubId).Select(x => ((TextBox)x.FindControl("Qty")).Text).FirstOrDefault().ToString());
                int slTong = slThem + slDaThem;
                string index = lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == Int32.Parse(((HiddenField)rs.FindControl("hdfSubId")).Value)).Select(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value)).FirstOrDefault().ToString();
                lstSub.Where(x => Int32.Parse(((HiddenField)x.FindControl("hdfSubId")).Value) == SubId).Select(x => { ((TextBox)x.FindControl("Qty")).Text = slTong.ToString(); return x; }).FirstOrDefault();
                LoadSubSelected();
            }
            else
            {
                lstSub.Add(rs);
                LoadSubSelected();
            }
        }

        public void LoadSubSelected()
        {
            btnTiep.Visible = true;
            lvSubSelected.DataSource = lstSub;
            lvSubSelected.DataBind();
            int ngay = 0;
            int tien = 0;
            for (int i = 0; i < lvSubSelected.Items.Count; i++)
            {
                ngay += Int32.Parse(((Label)lvSubSelected.Items[i].FindControl("lbTongNgay")).Text);
                tien += Int32.Parse(((Label)lvSubSelected.Items[i].FindControl("lbTongGia")).Text.Replace(",", string.Empty));
            }
            lbTongNgayMua.Attributes.Add("Style", "float: right");
            lbTongNgayMua.Text = ngay.ToString();
            lbTongTien.Text = tien.ToFormatMoney();
        }
        protected void lvSubSelected_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HiddenField lviID = (HiddenField)e.Item.FindControl("lviID");
            lviID.Value = ((HiddenField)lstSub[e.Item.DataItemIndex].FindControl("hdfSubId")).Value;
            Label lbTen = (Label)e.Item.FindControl("lbTen");
            Label lbSoLuongGoi = (Label)e.Item.FindControl("lbSoLuongGoi");
            Label lbTongNgay = (Label)e.Item.FindControl("lbTongNgay");
            Label lbTongGia = (Label)e.Item.FindControl("lbTongGia");
            lbTen.Text = ((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrSubContent")).Text;
            lbSoLuongGoi.Text = ((TextBox)lstSub[e.Item.DataItemIndex].FindControl("Qty")).Text;
            lbTongNgay.Text = (Int32.Parse(((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrDurday")).Text) * Int32.Parse(lbSoLuongGoi.Text)).ToString();
            lbTongGia.Text = (Int32.Parse((((Literal)lstSub[e.Item.DataItemIndex].FindControl("ltrPrice")).Text).Replace(",", string.Empty)) * Int32.Parse(lbSoLuongGoi.Text)).ToFormatMoney();

        }
        protected void lvSubSelected_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                if (lstSub.Count == 0)
                {
                    lbEmptySelected.Visible = true;
                    btnTiep.Visible = false;
                }
                else
                {

                    lstSub.RemoveAt(Int32.Parse(e.CommandArgument.ToString()));
                    LoadSubSelected();
                }
            }
        }
        protected void lvSubSelected_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }

        protected void btnTiep_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            //ddtMerName_SelectedIndexChanged(sender, e);
            SetShpInfo(int.Parse(ddtMerName.SelectedValue));
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ddtMerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            int merId = Int32.Parse(ddtMerName.SelectedValue);
            SetShpInfo(merId);
        }
        private void SetShpInfo(int merId)
        {
            var rs = (from s in MyLibrary.Shp_Bus.GetAll()
                      where s.MerId == merId
                      select s.ShpName).FirstOrDefault();
            lbShpName.Text = rs;
            lbTotalDay.Text = lbTongNgayMua.Text;
            lbTotalPrice.Text = lbTongTien.Text;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}