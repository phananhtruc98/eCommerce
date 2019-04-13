using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.Admin
{
    public partial class Manage_User : Page
    {
        readonly Mer_BUS mer_BUS = new Mer_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridViewData();
                LoadDropDownList_TimKiem();
            }
        }

        private void BindGridViewData()
        {
           
            gvMerchant.DataSource = mer_BUS.Get_Mer_Info().ToList();
            gvMerchant.DataBind();
        }
        protected void gvSub_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
        public void LoadDropDownList_TimKiem()
        {
            ddlTimKiemMerchant.DataSource = ddl_TimKiem_Field_M;
            ddlTimKiemMerchant.DataBind();
        }
        List<String> ddl_TimKiem_Field_M = new List<string>();

        protected void gvMerchant_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    ddl_TimKiem_Field_M.Add(e.Row.Cells[i].Text);
                }
            }
        }
    }
}