using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ShoesStore.DataAccessLogicLayer
{
    public class Pro_DAO : Table_DAO<Pro>
    {
        public override void SetActive(Pro obj)
        {
            throw new NotImplementedException();
        }

        public override bool IsExist(Pro obj)
        {
            throw new NotImplementedException();
        }
    }
}