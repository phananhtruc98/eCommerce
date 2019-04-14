using ShoesStore.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
namespace ShoesStore.Admin
{
    public partial class Manage_Administrator : Page
    {
     
        private readonly Mstr_BUS mstr_BUS = new Mstr_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindDataGridView();
                LoadDropDownList_TimKiem();
            }
        }

        private void BindDataGridView()
        {
            gvAdmin.DataSource = mstr_BUS.Get_Admin_Info();
            gvAdmin.DataBind();
        }

        public void LoadDropDownList_TimKiem()
        {
            ddlTimKiem.DataSource = ddl_TimKiem_Field;
            //for (int i = 0; i < ddl_TimKiem_Field.Count; i++)
            //{
            //    if(i>0)
            //    {
            //        ddlTimKiem.DataTextField = ddl_TimKiem_Field[i];
            //        ddlTimKiem.DataValueField = (i).ToString();
            //    }
            //}
            ddlTimKiem.DataBind();
        }

        List<String> ddl_TimKiem_Field = new List<string>();
        protected void gvAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    ddl_TimKiem_Field.Add(e.Row.Cells[i].Text);
                }
            }
        }

        protected void gvAdmin_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;//Tên cột
            string direction = MyLibrary.GetSortDirection();//Chiều (lấy theo viewstate)
            var rs = mstr_BUS.Get_Admin_Info().OrderBy(sortExpression+direction).ToList();
            gvAdmin.DataSource = rs.ToList();
            gvAdmin.DataBind();
        }
    }

}

