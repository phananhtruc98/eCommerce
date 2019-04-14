using ShoesStore.DataAccessLogicLayer;
using ShoesStore.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoesStore.BusinessLogicLayer
{
    public class MstrRole_BUS : Table_BUS<MstrRole, MstrRole_DAO>, IMstrRole
    {
    }
}