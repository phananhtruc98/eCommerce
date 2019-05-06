using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.WebControls
{
    public class RepeaterTable : Repeater
    {
        private int _pageCurrent = 1;
        private int _pageSize;
        private int _shpId;
        public TableName TableName;
        public int[] ColorIds { get; set; }
        public int[] BrandIds { get; set; }
        public int[] ProCatIds { get; set; }
        public double FilterPriceFrom { get; set; } = 0;
        public double FilterPriceTo { get; set; } = 999999;
        public Func<Pro, long> FuncFilter { get; set; } = pro => pro.DateAdd == null ? 0 : pro.DateAdd.Value.Ticks;

        public int PageCurrent
        {
            get => _pageCurrent;
            set
            {
                _pageCurrent = value;
                BindRptPaged();
            }
        }

        public int PageTotal { get; private set; }

        public int PageSize
        {
            set
            {
                _pageSize = value;
                //BindRptPaged();
            }
        }

        public int ShpId
        {
            set
            {
                _shpId = value;
                //Bind
            }
            get
            {
                return _shpId;
            }

        }

        public bool AllowPage { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            new BasePage
            {
                listWc = new List<Tuple<Control, TableName>>
                {
                    new Tuple<Control, TableName>(this, TableName)
                }
            }.Bind();
            PageTotal = (int)Math.Ceiling((double)((DataSource as IEnumerable<object>) ?? throw new InvalidOperationException()).Count() / _pageSize);
            ;
            if (AllowPage)
            {
                DataSource = (DataSource as IEnumerable<object>).Skip((_pageCurrent - 1) * _pageSize).Take(_pageSize);
                DataBind();
            }
        }

        private void BindRptPaged()
        {
            OnLoad(null);
        }

        protected override void Render(HtmlTextWriter output)
        {
            base.Render(output);
        }
    }
}