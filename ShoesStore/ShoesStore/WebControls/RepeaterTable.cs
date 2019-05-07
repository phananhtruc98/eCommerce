using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore.WebControls
{
    [Serializable]
    public class RepeaterTable : Repeater
    {
        private int _pageCurrent = 1;
        private int _pageSize;
        private int _shpId;
        public TableName TableName;
        public List<int> ColorIds { get; set; } = new List<int>();
        public List<int> BrandIds { get; set; } = new List<int>();
        public List<int> ProCatIds { get; set; } = new List<int>();
        public double FilterPriceFrom { get; set; } = 0;
        public double FilterPriceTo { get; set; } = 9999999;
        public int VFilterPro { get; set; }
        public Func<Pro, long> FuncFilter { get; set; } = pro => pro.DateAdd == null ? 0 : pro.DateAdd.Value.Ticks;
        public int PageCurrent
        {
            get => _pageCurrent;
            set
            {
                _pageCurrent = value;
                //BindRptPaged();
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
            get
            {
                return _pageSize;
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
            BindRpt();
        }

        private void BindRptPaged()
        {
            PageTotal = (int)Math.Ceiling((double)((DataSource as IEnumerable<object>) ?? throw new InvalidOperationException()).Count() / _pageSize);
            DataSource = (DataSource as IEnumerable<object>).Skip((_pageCurrent - 1) * _pageSize).Take(_pageSize);
        }
        private void BindRpt()
        {
            new BasePage
            {
                listWc = new List<Tuple<Control, TableName>>
                {
                    new Tuple<Control, TableName>(this, TableName)
                }
            }.Bind();

        }
        public void Reload()
        {
            BindRpt();
            if (AllowPage)
            {
                BindRptPaged();
            }
            DataBind();
        }

        
    }
}