﻿using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;
namespace ShoesStore.Interfaces
{
    interface IMer:IUsr<Mer>
    {
        ObjectResult<sp_Mer_Info_Result> Get_Mer_Info();
    }
}
