using ShoesStore.DataAccessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoesStore.Interfaces
{
    public interface IMstr: IUsr<IMstr>
    {
        ObjectResult<Admin_Info_Result> Get_Admin_Info();
    }
}
