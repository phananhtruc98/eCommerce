using ShoesStore.BusinessLogicLayer;
using ShoesStore.MyExtensions;
using System;
using System.Linq;
using System.Web.UI;

namespace ShoesStore.Admin
{
    public partial class Manage_Customer : Page
    {
        private readonly Cus_BUS cus_BUS = new Cus_BUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindDataGridView();
            }
        }

        private void BindDataGridView()
        {
            gvCustomer.DataSource = cus_BUS.Get_Cus_Info();
            gvCustomer.DataBind();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TimKiem(txtTimKiem.Text.UnSign().ToLower());
        }

        public void TimKiem(string search_key)
        {
            var rs = (from a in cus_BUS.Get_Cus_Info().ToList()
                      where a.UsrId.ToString().ContainsEx((search_key))
                            || a.UsrName.ContainsEx(search_key)
                            || a.Login.ContainsEx(search_key)
                            || a.Password.ContainsEx(search_key)
                            || a.Phone.ContainsEx(search_key)
                            || (a.DateAdd != null && a.DateAdd.ToString().ContainsEx(search_key))
                            || (a.DateAdd != null && a.DateEdit.ToString().ContainsEx(search_key))
                            || a.Address.ContainsEx(search_key)
                      select a).ToList();
            gvCustomer.DataSource = rs;
            gvCustomer.DataBind();
        }


    }
}