using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoesStore.BusinessLogicLayer;

namespace ShoesStore
{
    
    
    public partial class BasePage : System.Web.UI.Page
    {  
        public List<Tuple<Control,TableName>> listWc = new List<Tuple<Control, TableName>>();

        internal readonly ProCat_BUS _proCat = new ProCat_BUS();
        internal readonly ProBrand_BUS _proBrand = new ProBrand_BUS();
        internal readonly Usr_BUS _usr = new Usr_BUS();
        internal readonly WebInfo_BUS _webInfo = new WebInfo_BUS();
        internal readonly WebSlide_BUS _webSlide = new WebSlide_BUS();
        internal readonly Pro_BUS _pro = new Pro_BUS();
        protected virtual void Page_Load(object sender, EventArgs e)
        {

        }

        public void Bind()
        {
            foreach(var wc in listWc)
            {
            if (wc.Item1 is Repeater)
            {
                Repeater rptWc = (Repeater) wc.Item1;
                switch (wc.Item2)
                {
                    case TableName.Pro:
                    {
                        rptWc.DataSource = _pro.GetAll();
                        break;
                    }
                    case TableName.ProCat:
                    {
                        rptWc.DataSource = _proCat.GetAll();
                        break;
                    }
                    case TableName.ProBrand:
                    {
                        rptWc.DataSource = _proBrand.GetAll();
                        break;
                    }
                }
                

                rptWc.DataBind();
            }
            }
        }
       
    }
}