using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ShoesStore
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SQLDB.SQLDB.ConnectionString = "Server=DESKTOP-O0PUDLR\\SQLEXPRESS;Database=DB_student;Integrated Security=true";

            //SqlCommand sqlCon = new SqlCommand("SELECT * FROM courses");

            //DataTable dt = SQLDB.SQLDB.GetData(sqlCon);

            
        }
        protected void rptProCat_Init(object sender, EventArgs e)
        {

            rptProCat.DataSource = ((SiteMaster) Master)._proCat.GetAll();
            rptProCat.DataBind();
        }
    }
}