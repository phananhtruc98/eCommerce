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
        public TableName TableName;

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
                BindRptPaged();
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
            PageTotal = (int) Math.Ceiling((double) ((DataSource as IEnumerable<object>) ?? throw new InvalidOperationException()).Count() / _pageSize);
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