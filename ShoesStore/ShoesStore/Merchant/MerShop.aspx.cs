using System;
using System.Linq;
using System.Web.UI;
using ShoesStore.DataAccessLogicLayer;
using ShoesStore.MyExtensions;

namespace ShoesStore.Merchant
{
    public partial class MerShop : Page
    {
        protected static Pro _proDetView;
        protected static Shp _shpView;
        private void CollectUrl()
        {
            if (RouteData.Values["shpName"] != null && RouteData.Values["shpName"].ToString() != "WebResource.axd")
            {
                var ShpNameCode = RouteData.Values["shpName"].ToString();
                _shpView = MyLibrary.Shp_Bus.GetShp(ShpNameCode);
            }
        }
        public void LoadThongTin()
        {
            var shp = MyLibrary.Shp_Bus.GetAll() != null ? MyLibrary.Shp_Bus.GetAll().FirstOrDefault(m => m.ShpId == _shpView?.ShpId) : null;
            if (shp == null) return;
            lblShpName.Text = shp.ShpName;
            lblDateStart.Text = shp.DateStart.ToString();
            lblDesc.Text = shp.Desc;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CollectUrl();
                LoadThongTin();
                if (String.IsNullOrEmpty(lblDesc.Text))
                    lbMoTa.Visible = false;
                var ShpId = _shpView?.ShpId;
                if (ShpId == null) return;
                UcCusCmt.Shp = MyLibrary.Shp_Bus.GetAll() != null ? MyLibrary.Shp_Bus.GetAll().FirstOrDefault(m => m.ShpId == ShpId) : null;
                ucPro.ShpId = ShpId.Value;
                ucPro.Reload();
            }
        }
    }
}