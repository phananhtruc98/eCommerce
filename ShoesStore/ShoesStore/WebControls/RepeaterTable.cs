using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;
using ShoesStore.DataAccessLogicLayer;

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
        private int _pageSize=1;
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
                listWc =new List<Tuple<Control, TableName>>()
               {
                    new Tuple<Control, TableName>(this,TableName)
                }
            }.Bind();
           _pageTotal = (this.DataSource as IEnumerable<object>).Count();
           if (_allowPage)
           {
               this.DataSource = (this.DataSource as IEnumerable<object>).Skip(_pageCurrent - 1).Take(_pageSize);
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
