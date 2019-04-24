using System.Data.Objects;
using ShoesStore.DataAccessLogicLayer;

namespace ShoesStore.Interfaces
{
    public interface IMstr : IUsr<IMstr>
    {
        ObjectResult<sp_Admin_Info_Result> Get_Admin_Info();
    }
}