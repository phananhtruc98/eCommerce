using System;
using System.Web.UI;

namespace ShoesStore.UserControls
{
    public partial class UcSearch : UserControl
    {
        public delegate void ButtonSearchClick(object sender, EventArgs e);

        public string SearchText => txtSearch.Value;

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            OnSave(e);
        }

        protected void OnSave(EventArgs e)
        {
            var save = Save;
            if (Save != null) save(this, e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public event EventHandler Save;
    }
}