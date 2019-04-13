using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        private ProCat_BUS _proCat = new ProCat_BUS();
        public TableName TableName;
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

        }

        protected override void Render(HtmlTextWriter output)
        {
            base.Render(output);
            
        }
    }
}
