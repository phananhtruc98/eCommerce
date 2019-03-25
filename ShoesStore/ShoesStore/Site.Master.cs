﻿using ShoesStore.BusinessLogicLayer;
using ShoesStore.BusinessLogicLayer.Tables_BUS;
using ShoesStore.DataAccessLogicLayer;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoesStore
{
    public partial class SiteMaster : MasterPage
    {
        IProCat_BUS _proCat;
        IProBrand _proBrand;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }
        }

     
        protected void rptProCat_Init(object sender, EventArgs e)
        {
            _proCat = new ProCat_BUS();
            rptProCat.DataSource = _proCat.GetAll().ToList();
            rptProCat.DataBind();
        }

        protected void rptProBrand_Init(object sender, EventArgs e)
        {
            _proBrand = new ProBrand_BUS();
            rptProBrand.DataSource = _proBrand.GetAll().ToList();
            rptProBrand.DataBind();
        }
    }
}