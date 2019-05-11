using System;
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
    public partial class MerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             MyLibrary.ExposeProperty( () => new Usr().UsrName);
        }
    }
}