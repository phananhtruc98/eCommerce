using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.UserControls
{
    public partial class UcPro : UserControl
    {
        //public Button Btnn
        //{
        //    get
        //    {
        //        if (ViewState["btnn"] == null)
        //        {
        //            ViewState["btnn"] = btn;
        //        }

        //        return (Button)ViewState["btnn"];

        //    }
        //    set
        //    {
        //        ViewState["btnn"] = value;
        //    }

        //}

        public string SearchText
        {
            get
            {
                if (ViewState["SearchText"] == null) ViewState["SearchText"] = "";
                return ViewState["SearchText"].ToString();
            }
            set => ViewState["SearchText"] = value;
        }

        public List<int> ColorIds
        {
            get
            {
                if (ViewState["ColorIds"] == null) ViewState["ColorIds"] = new List<int>();
                return (List<int>) ViewState["ColorIds"];
            }
            set => ViewState["ColorIds"] = value;
        }

        public List<int> BrandIds
        {
            get
            {
                if (ViewState["BrandIds"] == null) ViewState["BrandIds"] = new List<int>();
                return (List<int>) ViewState["BrandIds"];
            }
            set => ViewState["BrandIds"] = value;
        }

        public List<int> ProCatIds
        {
            get
            {
                if (ViewState["ProCatIds"] == null) ViewState["ProCatIds"] = new List<int>();
                return (List<int>) ViewState["ProCatIds"];
            }
            set => ViewState["ProCatIds"] = value;
        }

        public double FilterPriceFrom
        {
            get
            {
                if (ViewState["FilterPriceFrom"] == null) ViewState["FilterPriceFrom"] = 0;
                return double.Parse(ViewState["FilterPriceFrom"].ToString());
            }
            set => ViewState["FilterPriceFrom"] = value;
        }

        public double FilterPriceTo
        {
            get
            {
                if (ViewState["FilterPriceTo"] == null) ViewState["FilterPriceTo"] = 9999999;
                return double.Parse(ViewState["FilterPriceTo"].ToString());
            }
            set => ViewState["FilterPriceTo"] = value;
        }

        public int VFilterPro
        {
            get
            {
                if (ViewState["VFilterPro"] == null) ViewState["VFilterPro"] = 0;
                return (int) ViewState["VFilterPro"];
            }
            set => ViewState["VFilterPro"] = value;
        }

        public Func<Pro, long> FuncFilter
        {
            get
            {
                if (ViewState["FuncFilter"] == null)
                {
                    Func<Pro, long> tmp = pro => pro.DateAdd == null ? 0 : pro.DateAdd.Value.Ticks;

                    ViewState["FuncFilter"] = tmp;
                }

                return (Func<Pro, long>) ViewState["FuncFilter"];
            }
            set => ViewState["FuncFilter"] = value;
        }

        public int PageSize
        {
            set
            {
                ViewState["PageSize"] = value;
                ;
                if (rptPro != null) rptPro.PageSize = value;
            }
            get
            {
                if (ViewState["PageSize"] == null) ViewState["PageSize"] = 1;
                return int.Parse(ViewState["PageSize"].ToString());
            }
        }

        public int NumberPerRow
        {
            set => ViewState["NumberPerRow"] = value;
            get
            {
                if (ViewState["NumberPerRow"] == null) ViewState["NumberPerRow"] = 4;
                return int.Parse(ViewState["NumberPerRow"].ToString());
            }
        }

        public int ShpId
        {
            get
            {
                if (ViewState["ShpId"] == null) ViewState["ShpId"] = 0;
                return (int) ViewState["ShpId"];
            }
            set => ViewState["ShpId"] = value;
        }

        public int GetCurrent()
        {
            return rptPro.Items.Count;
        }


        private void LoadPage()
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
                    //rptPro.Reload();
                    Reload();

                    break;
                case "ThatBtnClick":
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                rptPro.Reload();
                LoadPage();
            }
        }

        public void Reload()
        {
            rptPro.SearchText = SearchText;
            rptPro.ColorIds = ColorIds;
            rptPro.BrandIds = BrandIds;
            rptPro.ProCatIds = ProCatIds;
            rptPro.FilterPriceFrom = FilterPriceFrom;
            rptPro.FilterPriceTo = FilterPriceTo;
            rptPro.FuncFilter = FuncFilter;
            rptPro.VFilterPro = VFilterPro;
            rptPro.ShpId = ShpId;
            rptPro.Reload();
            LoadPage();
            DataBind();
        }

        protected void rptProPage_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                var btnPagingLast = (LinkButton) e.Item.FindControl("btnPagingLast");
                btnPagingLast.CommandArgument = rptProPage.Items.Count + "";
            }
        }

        public void SetFilter(string searchText, List<int> colorids, List<int> brandIds, List<int> proCatIds,
            double filterPriceFrom, double filterPriceTo, Func<Pro, long> funcFilter, int vFilterPro)
        {
            SearchText = searchText;
            ColorIds = colorids;
            BrandIds = brandIds;
            ProCatIds = proCatIds;
            FilterPriceFrom = filterPriceFrom;
            FilterPriceTo = filterPriceTo;
            FuncFilter = funcFilter;
            VFilterPro = vFilterPro;
            //
        }
    }
}