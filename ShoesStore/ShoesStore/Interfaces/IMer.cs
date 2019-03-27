using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    interface IMer:IUsr<Mer>
    {
        ObjectResult<Mer_Info_Result> Get_Mer_Info();
    }
}
