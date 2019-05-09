using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.UserControls
{
    public partial class UcSearch : System.Web.UI.UserControl
    {
        public delegate void ButtonSearchClick(object sender, EventArgs e);
        public event EventHandler Save;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string SearchText
        {
            get { return txtSearch.Value; }
        }
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            OnSave(e);
        }
        protected void OnSave(EventArgs e)
        {
            EventHandler save = Save;
            if (Save != null)
            {
                save(this, e);
            }
        }
    }
}