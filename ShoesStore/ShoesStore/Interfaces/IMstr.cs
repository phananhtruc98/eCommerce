using ShoesStore.DataAccessLogicLayer;
using System.Data.Objects;

namespace ShoesStore.Interfaces
{
    public interface IMstr: IUsr<IMstr>
    {
        ObjectResult<sp_Admin_Info_Result> Get_Admin_Info();
    }
}
