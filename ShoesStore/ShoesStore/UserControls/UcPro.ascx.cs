using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.WebControls;

namespace ShoesStore.UserControls
{
    public partial class UcPro : UserControl
    {
        private int _numberOnRow;
        private Pro_BUS _pro = new Pro_BUS();

        public int NumberOnRow
        {
            get => _numberOnRow == 0 ? 1 : _numberOnRow;
            set => _numberOnRow = value;
        }

        public RepeaterTable RptPro => rptPro;

        public int PageSize
        {
            set
            {
                if (rptPro != null) rptPro.PageSize = value;
            }
        }
        public int ShpId
        {
            set
            {
                if (rptPro != null) rptPro.ShpId = value;
            }
        }

        public int GetCurrent()
        {
            return rptPro.Items.Count;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Page.LoadComplete += Page_LoadComplete;
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            var listPage = new List<int>();
            if (rptPro != null)
                for (var i = 1; i <= rptPro.PageTotal; i++)
                    listPage.Add(i);
            if (rptProPage != null)
            {
                rptProPage.DataSource = listPage;
                rptProPage.DataBind();
            }
        }

        protected void MyBtnHandler(object sender, EventArgs e)
        {
            var btn = (LinkButton) sender;
            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    var page = Convert.ToInt32(btn.CommandArgument);
                    rptPro.PageCurrent = page;
                    rptPro.DataBind();
                    break;
                case "ThatBtnClick":
                    break;
            }
        }

        protected void rptProPage_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                var btnPagingLast = (LinkButton) e.Item.FindControl("btnPagingLast");
                btnPagingLast.CommandArgument = rptProPage.Items.Count + "";
            }
        }
    }
}