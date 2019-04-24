using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ShoesStore.WebControls
{
    public class RepeaterTable : Repeater
    {
        public TableName TableName;
        private int _pageCurrent = 1;
        public int PageCurrent
        {
            get => _pageCurrent;
            set
            {
                _pageCurrent = value;
                BindRptPaged();
            }
        }
        private int _pageTotal;
        public int PageTotal
        {
            get => _pageTotal;
        }
        private int _pageSize;
        public int PageSize
        {
            set
            {
                _pageSize = value;
                BindRptPaged();
            }
        }
        private bool _allowPage;
        public bool AllowPage
        {
            get => _allowPage;
            set => _allowPage = value;
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            new BasePage()
            {
                listWc = new List<Tuple<Control, TableName>>()
               {
                    new Tuple<Control, TableName>(this,TableName)
                }
            }.Bind();
            _pageTotal = (int) Math.Ceiling((double) (DataSource as IEnumerable<object>).Count() / _pageSize);;
            if (_allowPage)
            {
                DataSource = (DataSource as IEnumerable<object>).Skip((_pageCurrent - 1)*_pageSize).Take(_pageSize);
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
